;
; Bikelight.asm
;
; Created: 26.10.2018 21:02:11
; Author : beat
;

#define BOARD_VERSION 2

; register aliases
.def		_CAPTURE_L = r20
.def		_CAPTURE_H = r21
.def		_CAPTURE_PREV_L = r18
.def		_CAPTURE_PREV_H = r19
.def		_DELTA_L = r24
.def		_DELTA_H = r25
.def		_DELTA_PREV_L = r22
.def		_DELTA_PREV_H = r23
.def		_PULSES_L = r26
.def		_PULSES_H = r27
.def		_PULSES_PREV_L = r28
.def		_PULSES_PREV_H = r29
.def		WR_L = r16
.def		WR_H = r17
.def		_WR_L = r30
.def		_WR_H = r31
.def		_WR_X = r15
.def		_SREG_BUP = r0

;-----------------------------------------------------------------------------------------

; Interrupt jump vector table
.org 0x000
	rjmp	RESET
	rjmp	EXT_INT0
	rjmp	PC_INT0
	rjmp	PC_INT1
	rjmp	WDT
	rjmp	TIM1_CAPT
	rjmp	TIM1_COMPA
	rjmp	TIM1_COMPB
	rjmp	TIM1_OVF
	rjmp	TIM0_COMPA
	rjmp	TIM0_COMPB
	rjmp	TIM0_OVF
	rjmp	ANA_COMP
	rjmp	ADC_CC
	rjmp	EE_RDY
	rjmp	USI_STR
	rjmp	USI_OVF

;-----------------------------------------------------------------------------------------

; Timer input capture routine, change backlight power based on delay
TIM1_CAPT:
	; Save status register
	in		_SREG_BUP, SREG

	; Read data from timer
	in		_CAPTURE_L, ICR1L
	in		_CAPTURE_H, ICR1H
	; _DELTA = _CAPTURE - CAPTURE_PREV
	movw	_DELTA_L, _CAPTURE_L
	sub		_DELTA_L, _CAPTURE_PREV_L
	sbc		_DELTA_H, _CAPTURE_PREV_H

	; if _PULSES_PREV < 20 {} else goto TIM1_CAPT_END
	movw	_WR_L, _PULSES_PREV_L
	sbiw	_WR_L, 20
	brsh	TIM1_CAPT_END

	; Check if same or higher delta between pulses -> not speeding up
	cp		_DELTA_L, _DELTA_PREV_L
	cpc		_DELTA_H, _DELTA_PREV_H
	brsh	TIM1_CAPT_SLOW ; branch if _DELTA >= _DELTA_PREV

	; speed up or same
	; Back 30%
	ldi		_WR_L, 0x4f
	out		OCR0B, _WR_L
	rjmp	TIM1_CAPT_END

	; Check if slow down
TIM1_CAPT_SLOW:
	;_DELTA_PREV = _DELTA_PREV + (_DELTA_PREV >> 7) + (_DELTA_PREV >> 6)
	movw	_WR_L, _DELTA_PREV_L
	clr		_WR_X
	lsl		_WR_L
	rol		_WR_H
	rol		_WR_X
	add		_DELTA_PREV_L, _WR_H
	adc		_DELTA_PREV_H, _WR_X
	lsl		_WR_L
	rol		_WR_H
	rol		_WR_X
	add		_DELTA_PREV_L, _WR_H
	adc		_DELTA_PREV_H, _WR_X
	; Comparison with 16bit
	cp		_DELTA_PREV_L, _DELTA_L
	cpc		_DELTA_PREV_H, _DELTA_H
	brsh	TIM1_CAPT_END ; branch if _DELTA <= _DELTA_PREV

	; slow down
	; Back 100%
	ldi		_WR_L, 0xff
	out		OCR0B, _WR_L

TIM1_CAPT_END:
	; 
	movw	_DELTA_PREV_L, _DELTA_L
	movw	_CAPTURE_PREV_L, _CAPTURE_L
	adiw	_PULSES_L, 1
	; restore SREG
	out		SREG, _SREG_BUP
	reti

;-----------------------------------------------------------------------------------------

; Timer1 overflow interrupt
TIM1_OVF:
	; Use to increase max time to 0.5s roughly (16bit value)
	in		_SREG_BUP, SREG
	; if _PULSES >= 20 {} else goto TIM1_OVF_END
	movw	_WR_L, _PULSES_L
	sbiw	_WR_L, 20
	brlo	TIM1_OVF_END

	; if _PULSES + 1 < _PULSES_PREV else goto TIM1_OVF_FAST
;	movw	_WR_L, _PULSES_L
	adiw	_WR_L, 21
	cp		_WR_L, _PULSES_PREV_L
	cpc		_WR_H, _PULSES_PREV_H
	brsh	TIM1_OVF_FAST

	; slowing down
	ldi		_WR_L, 0xff
	out		OCR0B, _WR_L
	rjmp	TIM1_OVF_END

	; speeding up? (_PULSES > _PULSES_PREV)
TIM1_OVF_FAST:
	cp		_PULSES_PREV_L, _PULSES_L
	cpc		_PULSES_PREV_H, _PULSES_H
	brsh	TIM1_OVF_END
	; speeding up
	ldi		_WR_L, 0x4f
	out		OCR0B, _WR_L

TIM1_OVF_END:
	; _PULSES_PREV = _PULSES
	movw	_PULSES_PREV_L, _PULSES_L
	; _PULSES = 0
	clr		_PULSES_L
	clr		_PULSES_H
	; restore SREG
	out		SREG, _SREG_BUP
	reti

;-----------------------------------------------------------------------------------------

ADC_CC:
	; read in supply voltage based on value for 1.1V Bgap
	; go to low power mode if ADCH > 94 (left adjusted) -> Vin < 3
	in		_SREG_BUP, SREG
	in		_WR_L, ADCH
	cpi		_WR_L, 94
	brlo	ADC_END
	; reduce pwm for low power mode, enable DCDC
	ldi		_WR_L, 0x15
	out		OCR0A, _WR_L
	out		OCR0B, _WR_L
	in		_WR_L, PORTA
	ori		_WR_L, (1<<PA3)
	out		PORTA, _WR_L
ADC_END: 
	out		SREG, _SREG_BUP
	reti

;-----------------------------------------------------------------------------------------

EXT_INT0:
PC_INT0:
PC_INT1:
WDT:
TIM1_COMPA:
TIM1_COMPB:
TIM0_COMPA:
TIM0_COMPB:
TIM0_OVF:
ANA_COMP:
EE_RDY:
USI_STR:
USI_OVF:

RESET:
	; Initialize Stack (not enough memory for SPH)
	ldi		WR_L, low(RAMEND)
	out		SPL, WR_L

	; Power
	; Power reduction (serial interface)
	ldi		WR_L, (1<<PRUSI)
	out		PRR, WR_L

	; GPIO
	; Define PORTB (!Reset, CtrlF, NC, NC)
	ldi		WR_L, (1<<PB3)|(1<<PB1)|(1<<PB0)
	ldi		WR_H, (1<<DDB2)
	out		PORTB, WR_L
	out		DDRB, WR_H
	; Define PORTA (CtrlB, NC, NC, NC, DCDC, FreqIn, NC, NC)
	ldi		WR_L, (1<<ADC6D)|(1<<ADC5D)|(1<<ADC4D)|(1<<ADC2D)|(1<<ADC1D)|(1<<ADC0D)
	out		DIDR0, WR_L
	ldi		WR_L, (1<<PA6)|(1<<PA5)|(1<<PA4)|(1<<PA1)|(1<<PA0)
	ldi		WR_H, (1<<DDA7)|(1<<DDA3)
	out		PORTA, WR_L
	out		DDRA, WR_H

	; Analog Comparator
	; Analog comparator input capture, Internal 1v1 bgap falling edge -> input rising above 1.1V
	ldi		WR_L, (1<<ACBG)|(1<<ACI)|(2<<ACIS0)
	out		ACSR, WR_L
	; Erase pending interrupts
	in		WR_L, ACSR
	out		ACSR, WR_L
	; Enable input capture on Timer 1
	sbi		ACSR, ACIC

	; Timer
	; Timer1 (freq in / speed)
	; Normal mode (16bit), NoiseCanceler active, falling edge, 8 prescaler (2 Hz)
	; Overflow (2^16) and ICP interrupt enabled

	; Init with prev slow speed
	ldi		_DELTA_PREV_H, 0xff
	; Clear inputCapture register
	clr		WR_L
	out		ICR1H, WR_L
	out		ICR1L, WR_L
	; IC enabled, falling edge, NC enabled, 8 prescaler, Normal mode (0xFFFF)
	ldi		WR_L, 0x00
	out		TCCR1A, WR_L
	ldi		WR_L, (1<<ICNC1)|(2<<CS10)
	out		TCCR1B, WR_L
	; clear pending interrupts timer1
	in		WR_L, TIFR1
	out		TIFR1, WR_L
	; Input capture and overflow interrupt of timer1
	ldi		WR_L, (1<<ICIE1)|(1<<TOIE1)
	out		TIMSK1, WR_L

	; Timer0 (PWM)
	; PWM Output for LED control (roughly 245 Hz for 1 MHz)
	; Phase correct PWM, 8 prescaler

	; 100% (255) for front
	ldi		WR_L, 0xff
	out		OCR0A, WR_L
	; 31% (79) for back
	ldi		WR_L, 0x4f
	out		OCR0B, WR_L
	; no interrupts
	ldi		WR_L, 0x00
	out		TIMSK0, WR_L
	; PWM output A and B enabled, 8bit phase correct PWM
	ldi		WR_L, (2<<COM0A0)|(2<<COM0B0)|(1<<WGM00)
	out		TCCR0A, WR_L
	; 8 prescaler
	ldi		WR_L, (2<<CS00)
	out		TCCR0B, WR_L

;	; ADC VoltageMeasurement
;	; Vcc as reference, 1.1V BandGap as measurement, autotrigger by 500Hz Timer1, left adjust
;	ldi		WR_L, (1<<MUX5)|(1<<MUX0)
;	out		ADMUX, WR_L
;	ldi		WR_L, (1<<ADLAR)|(1<<ADTS2)|(ADTS1)
;	out		ADCSRB, WR_L
;	ldi		WR_L, (1<<ADEN)|(1<<ADATE)|(1<<ADIF)|(1<<ADIE)|(1<<ADPS1)|(1<<ADPS0)
;	out		ADCSRA, WR_L

	; Enable interrupts
	sei

	; Main loop (empty or sleep)
MAIN:
	rjmp	MAIN

;	ldi		WR_L, (1<<SE)
;	out		MCUCR, WR_L
;	sleep
;	clr		WR_L
;	out		MCUCR, WR_L
;   rjmp	MAIN

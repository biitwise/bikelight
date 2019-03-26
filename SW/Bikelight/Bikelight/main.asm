;
; Bikelight.asm
;
; Created: 26.10.2018 21:02:11
; Author : beat
;

#define BOARD_VERSION 2

; register aliases
.def		_SPEED_0 = r21
.def		_SPEED_1 = r24
.def		_SPEED_2 = r25
.def		_SPEED_PREV_0 = r20
.def		_SPEED_PREV_1 = r22
.def		_SPEED_PREV_2 = r23
.def		WR_L = r16
.def		WR_H = r17
.def		_WR_L = r18
.def		_WR_H = r19
.def		_SREG_BUP = r0

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

; Timer input capture routine, change backlight power based on delay
TIM1_CAPT:
	in		_SREG_BUP, SREG
;	in		_SPEED_0, ICR1H ; read data from timer, r5 already contains data
	in		_SPEED_0, ICR1L

//	subi	_SPEED_PREV_0, -100
//	sbci	_SPEED_PREV_1, 0xff
//	sbci	_SPEED_PREV_2, 0xff

	; Comparison with 24bit
	cp		_SPEED_0, _SPEED_PREV_0 ; compare with prev registers
	cpc		_SPEED_1, _SPEED_PREV_1
	cpc		_SPEED_2, _SPEED_PREV_2
	brsh	TIM1_CAPT_SLOW ; branch if _SPEED > _SPEED_PREV

#if BOARD_VERSION == 1
	; speed up
	; Front 100%
	ldi		_WR_H, 0x00
	ldi		_WR_L, 0xff
	out		OCR1AH, _WR_H
	out		OCR1AL, _WR_L
	; Back 30%
	ldi		_WR_H, 0x00
	ldi		_WR_L, 0x4f
	out		OCR1BH, _WR_H
	out		OCR1BL, _WR_L
	rjmp	TIM1_CAPT_END
	; slow down
TIM1_CAPT_SLOW:
	; Front 100%
	ldi		_WR_H, 0x00
	ldi		_WR_L, 0xff
	out		OCR1AH, _WR_H
	out		OCR1AL, _WR_L
	; Back 100%
	ldi		_WR_H, 0x00
	ldi		_WR_L, 0xff
	out		OCR1BH, _WR_H
	out		OCR1BL, _WR_L
#else
	; speed up
	; Front 100%
	ldi		_WR_L, 0xff
	out		OCR0A, _WR_L
	; Back 30%
	ldi		_WR_L, 0x4f
	out		OCR0B, _WR_L
	rjmp	TIM1_CAPT_END
	; slow down
TIM1_CAPT_SLOW:
	; Front 100%
	ldi		_WR_L, 0xff
	out		OCR0A, _WR_L
	; Back 100%
	ldi		_WR_L, 0xff
	out		OCR0B, _WR_L
#endif
TIM1_CAPT_END:
	mov		_SPEED_PREV_0, _SPEED_0 ; store to prev registers
	mov		_SPEED_PREV_1, _SPEED_1 ; store to prev registers (word)
	mov		_SPEED_PREV_2, _SPEED_2 ; store to prev registers (word)
	clr		_SPEED_1
	clr		_SPEED_2
	out		SREG, _SREG_BUP
	reti

; Timer1 overflow interrupt, increment counter for 32 bit value
TIM1_OVF:
	; Use to increase max time to 0.5s roughly (16bit value)
	in		_SREG_BUP, SREG
	adiw	_SPEED_1, 1
	out		SREG, _SREG_BUP
	reti

ADC_CC:
	; read in supply voltage based on value for 1.1V Bgap
	; go to low power mode if ADCH > 94 (left adjusted) -> Vin < 3
	in		_SREG_BUP, SREG
	in		_WR_L, ADCH
	cpi		_WR_L, 94
	brlo	ADC_END
#if BOARD_VERSION == 1
	; reduce pwm for low power mode
	ldi		_WR_H, 0x00
	ldi		_WR_L, 0x15
	out		OCR1AH, _WR_H
	out		OCR1AL, _WR_L
	out		OCR1BH, _WR_H
	out		OCR1BL, _WR_L
#else
	; reduce pwm for low power mode
	ldi		_WR_L, 0x15
	out		OCR0A, _WR_L
	out		OCR0B, _WR_L
#endif
	out		SREG, _SREG_BUP
	reti
ADC_END: 
	; Do nothing (normal mode)
	out		SREG, _SREG_BUP
	reti

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
	; Initialize Stack
	ldi		WR_L, low(RAMEND)
	out		SPL, WR_L

	; Power
#if BOARD_VERSION == 1
	; Power reduction (disable timer0 and serial interface)
	ldi		WR_L, (1<<PRTIM0)|(1<<PRUSI)
#else
	; Power reduction (serial interface)
	ldi		WR_L, (1<<PRUSI)
#endif

	; GPIO
#if BOARD_VERSION == 1
	; Define PORTB all pullup inputs
	ldi		WR_L, (1<<PB3)|(1<<PB2)|(1<<PB1)|(1<<PB0)
	ldi		WR_H, 0
	out		PORTB, WR_L
	out		DDRB, WR_H
	; Define PORTA (FreqIn, CtrlF, CtrlB, NC, DCDC, NC, NC, VoltIn)
	ldi		WR_L, (1<<PA7)|(1<<PA4)|(1<<PA2)|(1<<PA1)|(1<<PA0)
	ldi		WR_H, (1<<DDA6)|(1<<DDA5)|(1<<DDA3)
	out		PORTA, WR_L
	out		DDRA, WR_H
#else
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
#endif

	; Timer
#if BOARD_VERSION == 1
	; Previous register for freq. comparison (highest one -> always considered faster that way)
	; PWM Output for LED control  (<500Hz for 1MHz) and Timer for frequency input
	; FastPWM 8bit, NoiseCanceler active, rising edge, 8 prescaler (490 Hz)
	; Overflow (256) and ICP interrupt enabled
	ldi		_SPEED_PREV_2, 0xff
	ldi		WR_H, 0x00
	ldi		WR_L, 0xff
	out		OCR1AH, WR_H
	out		OCR1AL, WR_L
	ldi		WR_H, 0x00
	ldi		WR_L, 0x4f
	out		OCR1BH, WR_H
	out		OCR1BL, WR_L
	out		ICR1H, WR_H
	out		ICR1L, WR_H
	ldi		WR_L, (2<<COM1A0)|(2<<COM1B0)|(1<<WGM10)
	out		TCCR1A, WR_L
	ldi		WR_L, (1<<ICNC1)|(1<<ICES1)|(1<<WGM12)|(2<<CS10)
	out		TCCR1B, WR_L
	in		WR_L, TIFR1
	out		TIFR1, WR_L
	ldi		WR_L, (1<<ICIE1)|(1<<TOIE1)
	out		TIMSK1, WR_L
#else
	; Previous register for freq. comparison (highest one -> always considered faster that way)
	; Analog comparator input capture, Internal 1v1 bgap, 
	ldi		WR_L, (1<<ACBG)|(1<<ACIC)
	out		ACSR, WR_L

	; PWM Output for LED control  (<500Hz for 1MHz) (Timer0)
	; Timer1 for frequency input

	; Timer1 (freq in / speed)
	; FastPWM 8bit, NoiseCanceler active, rising edge, 8 prescaler (490 Hz)
	; Overflow (256) and ICP interrupt enabled
	; Init with prev slow speed
	ldi		_SPEED_PREV_2, 0xff
	; Clear inputCapture register
	ldi		WR_H, 0x00
	out		ICR1H, WR_H
	out		ICR1L, WR_H
	; IC enabled, NC enabled, 8 prescaler, FastPWM 8bit
	ldi		WR_L, (1<<WGM10)
	out		TCCR1A, WR_L
	ldi		WR_L, (1<<ICNC1)|(1<<ICES1)|(1<<WGM12)|(2<<CS10)
	out		TCCR1B, WR_L
	; clear pending interrupts timer1
	in		WR_L, TIFR1
	out		TIFR1, WR_L
	; Input capture and overflow interrupt of timer1
	ldi		WR_L, (1<<ICIE1)|(1<<TOIE1)
	out		TIMSK1, WR_L

	; Timer0 (PWM)
	; Phase correct PWM, 8 prescaler (roughly 245 Hz)
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
#endif

	; ADC VoltageMeasurement
	; Vcc as reference, 1.1V BandGap as measurement, autotrigger by 500Hz Timer1, left adjust
#if BOARD_VERSION == 1
	ldi		WR_L, (1<<ADC4D)|(1<<ADC2D)|(1<<ADC1D)|(1<<ADC0D)
	out		DIDR0, WR_L
#endif
	ldi		WR_L, (1<<MUX5)|(1<<MUX0)
	out		ADMUX, WR_L
	ldi		WR_L, (1<<ADLAR)|(1<<ADTS2)|(ADTS1)
	out		ADCSRB, WR_L
	ldi		WR_L, (1<<ADEN)|(1<<ADATE)|(1<<ADIF)|(1<<ADIE)|(1<<ADPS1)|(1<<ADPS0)
	out		ADCSRA, WR_L

	sei

MAIN:
	ldi		WR_L, (1<<SE)
	out		MCUCR, WR_L
	sleep
	clr		WR_L
	out		MCUCR, WR_L
    rjmp	MAIN

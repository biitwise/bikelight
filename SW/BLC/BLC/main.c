/*
 * BLC.c
 *
 * Created: 26.03.2019 18:28:59
 * Author : beat
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>

//static volatile uint8_t prevCaptureVal = 0;
//static volatile uint16_t timer1OvfCnt = 0;
//static volatile uint32_t prevSpeed = 0xffffffff;
static volatile uint16_t pulseCount = 0;
static volatile uint16_t prevPulseCount = 0;

ISR(ADC_vect)
{
	// read in supply voltage based on value for 1.1V Bgap
	// go to low power mode if ADCH > 94 (left adjusted) -> Vin < 3
	if(ADCH > 94)
	{
		// reduce pwm for low power mode
		OCR0A = 0x15;
		OCR0B = 0x15;
	}
}

ISR(TIM1_CAPT_vect)
{
pulseCount++;
/*
	// Timer input capture routine, change backlight power based on delay
	uint8_t captureVal = ICR1L;
	volatile uint32_t speed = (captureVal  + (uint32_t)timer1OvfCnt << 8) - prevCaptureVal;

	if(speed > prevSpeed + 10)
	{
		//slowing down
		OCR0A = 0xff;
		OCR0B = 0xff;
	}
	else
	{
		//speeding up (reduce back to 30%)
		OCR0A = 0xff;
		OCR0B = 0x0f;
	}

	prevSpeed = speed;
	prevCaptureVal = captureVal;
	timer1OvfCnt = 0;*/
}

ISR(TIM1_OVF_vect)
{
	if(pulseCount + 1 < prevPulseCount)
	{
		//slowing down
		OCR0A = 0xff;
		OCR0B = 0xff;
	}
	if(pulseCount > prevPulseCount)
	{
		//speeding up (reduce back to 30%)
		OCR0A = 0xff;
		OCR0B = 0x0f;
	}
	prevPulseCount = pulseCount;
	pulseCount = 0;
	//timer1OvfCnt++;
}

ISR(ANA_COMP_vect)
{
	pulseCount++;
}

void initMCU()
{
	//Power reduction (serial interface)
	PRR = (1<<PRUSI);
}

void initGPIO()
{
	//PORTB (!Reset, CtrlF, NC, NC)
	PORTB = (1<<PORTB3)|(1<<PORTB1)|(1<<PORTB0);
	DDRB = (1<<DDB2);
	//PORTA (CtrlB, NC, NC, NC, DCDC, FreqIn, NC, NC)
	DIDR0 = (1<<ADC6D)|(1<<ADC5D)|(1<<ADC4D)|(1<<ADC2D)|(1<<ADC1D)|(1<<ADC0D);
	PORTA = (1<<PORTA6)|(1<<PORTA5)|(1<<PORTA4)|(1<<PORTA1)|(1<<PORTA0);
	DDRA = (1<<DDA7)|(1<<DDA3);
}

void initTimer()
{
	// Previous register for freq. comparison (highest one -> always considered faster that way)
	// Analog comparator input capture, Internal 1v1 bgap
	//ACSR = (1<<ACBG)|(1<<ACIC);
	ACSR = (1<<ACBG)|(1<<ACI)|(2<<ACIS0);//falling edge
	ACSR = ACSR; //clear eventual interrupts
	ACSR |= (1<<ACIE); //enable interrupt

	// PWM Output for LED control  (<500Hz for 1MHz) (Timer0)
	// Frequency input for speed estimation (Timer1)

	// Timer1 (freq in / speed)
	// FastPWM 8bit, NoiseCanceler active, rising edge, 8 prescaler (490 Hz)
	// Overflow (256) and ICP interrupt enabled
	// Clear inputCapture register
	ICR1 = 0;
	// IC enabled, NC enabled, 8 prescaler, FastPWM 8bit
	TCCR1A = (1<<WGM10);
	TCCR1B = (1<<ICNC1)|(1<<ICES1)|(1<<WGM12)|(5<<CS10);
	// clear pending interrupts timer1
	TIFR1 = TIFR1;
	// Input capture and overflow interrupt of timer1
	TIMSK1 = (1<<ICIE1)|(1<<TOIE1);

	// Timer0 (PWM)
	// Phase correct PWM, 8 prescaler (roughly 245 Hz)
	// 100% (255) for front
	OCR0A = 0xff;
	// 31% (79) for back
	OCR0B = 0x4f;
	// no interrupts
	TIMSK0 = 0x00;
	// PWM output A and B enabled, 8bit phase correct PWM
	TCCR0A = (2<<COM0A0)|(2<<COM0B0)|(1<<WGM00);
	// 8 prescaler
	TCCR0B = (2<<CS00);
}

void initADC()
{
	// ADC VoltageMeasurement
	// Vcc as reference, 1.1V BandGap as measurement, autotrigger by 500Hz Timer1, left adjust
	ADMUX = (1<<MUX5)|(1<<MUX0);
	ADCSRB = (1<<ADLAR)|(1<<ADTS2)|(1<<ADTS1);
	ADCSRA = (1<<ADEN)|(1<<ADATE)|(1<<ADIF)|(1<<ADIE)|(1<<ADPS1)|(1<<ADPS0);
}


int main(void)
{
	initMCU();
	initGPIO();
	initADC();
	initTimer();

	sei();
    /* Replace with your application code */
    while (1) 
    {
    }
}


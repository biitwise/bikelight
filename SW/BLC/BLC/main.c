/*
 * BLC.c
 *
 * Created: 26.03.2019 18:28:59
 * Author : beat
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>

// Timer value of previous interrupt, used to calculate time between pulses
static volatile uint16_t prevCaptureVal = 0;
// Previous time between pulses
static volatile uint16_t prevSpeed = 0;
// Amount of pulses per Timer period
static volatile uint16_t occCounter = 0;
// Previous amount of pulses per Timer period
static volatile uint16_t prevOccCounter = 0;


// ADC interrupt after measurement. used to switch LEDs to low power if supply drops (Standlicht)
// LEDs are reset with next pulse from dynamo
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

// Input capture interrupt, measures time between pulses and increments pulse counter
ISR(TIM1_CAPT_vect)
{
	PINA = 1<<PORTA5;

	uint16_t captureVal = ICR1;
	// Calculation overflows if timer overflowed -> no problem -> no need to track
	uint16_t speed = captureVal - prevCaptureVal;

	// Not active at high speeds to prevent noise
	if(prevOccCounter < 20)
	{
		// speed > prevSpeed * 1.0234375 (good bit slower) -> Hysteresis
		if(speed > prevSpeed + (prevSpeed >> 6) + (prevSpeed >> 7))
		{
			// Breaking
			//OCR0A = 0xff; // Front light to full power
			OCR0B = 0xff; // Back light to full power
			//PORTA |= 1<<PORTA4; // Debug pin high
		}
		if(speed < prevSpeed)
		{
			// Speeding up
			//OCR0A = 0x1f; // Front light to low power
			OCR0B = 0x4f; // Back light to lower power
			//PORTA &= ~(1<<PORTA4); // Debug pin low
		}
	}

	prevCaptureVal = captureVal;
	prevSpeed = speed;

	occCounter++;
}

// Timer overflow interrupt, compares amount of pulses per time
// breaking if less pulses than before
ISR(TIM1_OVF_vect)
{
	// Only active if speed high enough to reduce noise
	if(occCounter >= 20)
	{
		if(occCounter < prevOccCounter - 1)
		{
			//OCR0A = 0xff;
			OCR0B = 0xff;
			//PORTA |= 1<<PORTA4;
		}
		if(occCounter > prevOccCounter)
		{
			//OCR0A = 0x1f;
			OCR0B = 0x4f;
			//PORTA &= ~(1<<PORTA4);
		}
	}
	prevOccCounter = occCounter;
	occCounter = 0;
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

void initAC()
{
	// Analog comparator input capture, Internal 1v1 bgap
	//ACSR = (1<<ACBG)|(1<<ACIC);
	ACSR = (1<<ACBG)|(1<<ACI)|(2<<ACIS0); //falling edge -> input rising above 1.1V
	ACSR = ACSR; //clear eventual interrupts
	ACSR |= (1<<ACIC); //enable input capture
}

void initTimer1()
{
	
	// Frequency input for speed estimation (Timer1)
	// Timer1 (freq in / speed)
	// Normal mode (16bit), NoiseCanceler active, falling edge, 8 prescaler
	// Overflow (2^16) and ICP interrupt enabled
	// Clear inputCapture register
	ICR1 = 0;
	// IC enabled, NC enabled, 8 prescaler
	TCCR1A = 0;
	TCCR1B = (1<<ICNC1)|(2<<CS10);
	// clear pending interrupts timer1
	TIFR1 = TIFR1;
	// Input capture and overflow interrupt of timer1
	TIMSK1 = (1<<ICIE1)|(1<<TOIE1);
}

void initTimer0()
{
	// PWM Output for LED control  (<500Hz for 1MHz) (Timer0)
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
	initAC();
//	initADC();
	initTimer0();
	initTimer1();

	sei();
    while (1) 
    {
    }
}


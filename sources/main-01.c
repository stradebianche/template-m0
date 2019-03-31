#include <stdint.h>

#define IOPBEN (1<<2)
#define LED_PIN 5

struct GPIO {
	volatile uint32_t CRL;
	volatile uint32_t CRH;
	volatile uint32_t IDR;
	volatile uint32_t ODR;
	volatile uint32_t BSRR;
	volatile uint32_t BRR;
	volatile uint32_t LCKR;
};

/* Vector table */
//asm(".long 0x20001000");
//asm(".long main");

volatile uint32_t * const RCC_AHBENR = (uint32_t*) 0x40021018;
struct GPIO * const GPIOB = (struct GPIO*)0x40010800;

static void delay(uint32_t v)
{
	for(;v > 0; v--);
}

unsigned _delay = 500000;

int main(void) {

	*RCC_AHBENR |= IOPBEN;
	GPIOB->CRL = ((1UL << 4*5));
	
	for(;;) {
		GPIOB->ODR = ~GPIOB->ODR;
		delay(_delay);
	}

	return 0;
}

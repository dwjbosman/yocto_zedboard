/*
 * main.c
 *
 *  Created on: Feb 16, 2019
 *      Author: dinne
 */
#include <mb_interface.h>
#include <xparameters.h>

int main() {

	microblaze_disable_interrupts();                /* Disable Interrupts */
	microblaze_disable_icache();                    /* Disable Instruction Cache */
	microblaze_disable_dcache();                    /* Disable Instruction Cache */

	for(;;) {
		uint32_t addr = XPAR_PS7_DDR_0_HP0_AXI_BASENAME;
		uint32_t offs = 0;
		uint8_t *data = 0;
		for (offs=0; offs<255; offs++) {
			data = (uint8_t*)(addr+offs);
			*data = offs;
		}
	}
	return 0;
}

/*
 * Empty C++ Application
 */

#include "isa_hw.h"

#define WRITE (0x01)
#define READ  (0x02)

int main(void)
{
	int addr;
	int rdata;
    int wdata;

    wdata = 0x1234;
    addr = 0xE846;
    printf("[OUT] 0x%x = 0x%x\n", addr, wdata);
    ISA_FPGA(WRITE, addr, wdata);//0xE846 oxEAC8
    rdata = ISA_FPGA(READ, addr, wdata);
    printf("[IN]  0x%x = 0x%x\n", addr, rdata);

    wdata = 0xABCD;
    addr = 0xE886;
    printf("[OUT] 0x%x = 0x%x\n", addr, wdata);
    ISA_FPGA(WRITE, addr, wdata);//0xE846 oxEAC8
    rdata = ISA_FPGA(READ, addr, wdata);
    printf("[IN]  0x%x = 0x%x\n", addr, rdata);

    return 0;
}

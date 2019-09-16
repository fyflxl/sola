/*
 * Empty C++ Application
 */

#include "isa_hw.h"

int main( int argc, char *argv[])
{
	int addr;
	int rdata;
    int wdata;
    if(argc==1)
    {
    	wdata = 0xABCD;
    	addr  = 0xE846;
    	printf("Default addr:0x%x, wdata: 0x%x\n", addr, wdata);
    }
    else
    {
    	addr = strtol(argv[1], NULL, 16);
        puts(argv[1]);
        wdata  = strtol(argv[2], NULL, 16);
        puts(argv[2]);
    }
    printf("WDATA = 0x%x\n", wdata);
    ISA_FPGA(0x01, addr, wdata);//0xE846 oxEAC8
    rdata = ISA_FPGA(0x02, addr, wdata);
    printf("RDATA = 0x%x\n", rdata);

    return 0;
}


#include "isa_hw.h"

int ISA_FPGA(int mode, int isa_addr, int wdata)
{
	int rdata = 0xFFFF;
	unsigned int ap_idle;
	unsigned int ap_done;
//	double time;

	unsigned long int xbase_address = ISA_BASEADDR;

	while(1)//Wait for IDLE
	{
		ap_idle = ((ReadReg(xbase_address, ISA_CTRL_BUS_ADDR_AP_CTRL) >> 2) && 0x1);
		if(ap_idle)
			break;
	}

	WriteReg(xbase_address, ISA_CTRL_BUS_ADDR_ISA_MODE, mode);//0x01 write; 0x02 read
	WriteReg(xbase_address, ISA_CTRL_BUS_ADDR_ISA_ADDR, isa_addr);
	if(mode == 0x01)
		WriteReg(xbase_address, ISA_CTRL_BUS_ADDR_WDATA, wdata);

	WriteReg(xbase_address, ISA_CTRL_BUS_ADDR_AP_CTRL, 0x1);//Start
	while(1)
	{
		ap_done = ((ReadReg(xbase_address, ISA_CTRL_BUS_ADDR_AP_CTRL) >> 1) && 0x1);
		if(ap_done)
			break;
	}
	if(mode == 0x02)
		rdata = ReadReg(xbase_address, ISA_CTRL_BUS_ADDR_RDATA);

	if(mode == 0x01)
    	printf("[OUT] 0x%x = 0x%x\n", isa_addr, wdata);
	else if(mode == 0x02)
	{
		if(wdata == rdata)
			printf("[IN]  0x%x = 0x%x |Read 0x%x == 0x%x\n", isa_addr, wdata, rdata, wdata);
		else
			printf("[IN]  0x%x = 0x%x |Read 0x%x != 0x%x\n", isa_addr, wdata, rdata, wdata);
	}


	return rdata;

}

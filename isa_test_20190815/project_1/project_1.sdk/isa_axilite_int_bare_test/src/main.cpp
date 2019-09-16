/*
 * Empty C++ Application
 */

#include "isa_hw.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xscugic.h"
#include "xil_printf.h"

#define INTC_DEVICE_ID	XPAR_SCUGIC_SINGLE_DEVICE_ID
#define INTC		XScuGic

#define READ  (0x02)
#define WRITE (0x01)

void ISAHandler(void *CallbackRef)
{
	int base_addr = *((int *)CallbackRef);
	printf("[Trigger INT61] ISAHandler 0x%x START\n", base_addr);
	if(base_addr == 0xE840)
		ISA_FPGA(READ, 0xEB00 + 1*2, 0xFFFD);//0xE840
	else if(base_addr == 0xE880)
		ISA_FPGA(READ, 0xEB00 + 1*2, 0xFFFB);//0xE880
    ISA_FPGA(WRITE, base_addr, 0x4400);
    printf("ISAHandler END\n", base_addr);
}

int SetupIntrSystem(INTC *IntcInstancePtr, void *InstancePtr, u16 IntrId)
{
	int Result;
	XScuGic_Config *IntcConfig;
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Result = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Result != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XScuGic_SetPriorityTriggerType(IntcInstancePtr, IntrId,
					0xA0, 0x3);

	/*
	 * Connect the interrupt handler that will be called when an
	 * interrupt occurs for the device.
	 */
	Result = XScuGic_Connect(IntcInstancePtr, IntrId,
				 (Xil_ExceptionHandler)ISAHandler, InstancePtr);
	if (Result != XST_SUCCESS) {
		return Result;
	}

	/* Enable the interrupt for the GPIO device.*/
	XScuGic_Enable(IntcInstancePtr, IntrId);
	/*
	 * Initialize the exception table and register the interrupt
	 * controller handler with the exception table
	 */
//	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			 (Xil_ExceptionHandler)XScuGic_InterruptHandler, IntcInstancePtr);
	/* Enable non-critical exceptions */
	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

void TriggerInt(int base_addr)
{
	const int wdata_array0[32] = {
			0,  0, 0, 0, 0, 0, 0, 0, 0x83F,
			0x1, 0xF19, 0x101, 0xD780, 0x9E30, 0, 0x9F40,
			0, 0x2710, 0, 0, 0, 0, 0xE000, 0x200,
			0x40, 0, 0, 0, 0, 0, 0, 0
	};

	int x;

	ISA_FPGA(WRITE, base_addr + 0x6, 0x1234);//0xE846 oxEAC8
	ISA_FPGA(READ,  base_addr + 0x6, 0x1234);

    ISA_FPGA(WRITE, base_addr, 0x8000);
    ISA_FPGA(READ, 0xEB00 + 4*2, 0xFFFF);
    for(x=0; x<32; x++)
    {
    	ISA_FPGA(WRITE, base_addr + x*2, wdata_array0[x]);
    }
    ISA_FPGA(WRITE, base_addr + 31*2, 0xF000);
    ISA_FPGA(WRITE, base_addr + 8*2,  0x800);

    ISA_FPGA(WRITE, base_addr + 22*2,  0xE000);
    ISA_FPGA(WRITE, base_addr + 23*2,   0x200);
    ISA_FPGA(WRITE, base_addr + 12*2,  0xD780);
    ISA_FPGA(WRITE, base_addr + 24*2,    0x40);
    ISA_FPGA(WRITE, base_addr + 24*2,    0x40);

    ISA_FPGA(WRITE, base_addr + 13*2,  0x9E30);
    ISA_FPGA(WRITE, base_addr + 22*2,  0xE000);
    ISA_FPGA(WRITE, base_addr + 8*2,    0x800);

    ISA_FPGA(WRITE, base_addr + 15*2,  0x9F40);
    ISA_FPGA(READ,  0xEB00 + 4*2, 0xFFFF);
    ISA_FPGA(READ,  base_addr + 1*2, 0);
    usleep(1000000);
    ISA_FPGA(WRITE, base_addr + 0*2,   0x2000);

    ISA_FPGA(WRITE, base_addr + 10*2,   0xF32);
    ISA_FPGA(WRITE, base_addr + 10*2,  0x1932);
    ISA_FPGA(WRITE, base_addr + 0*2,    0x800);

    if(base_addr == 0xE840)
    	ISA_FPGA(WRITE, 0xEB00 + 1*2,      0x2);//0xE840
    else if(base_addr == 0xE880)
    	ISA_FPGA(WRITE, 0xEB00 + 1*2,      0x4);//0xE880
    printf("Wait for INT...\n");
}

INTC Intc;

int main( int argc, char *argv[])
{
	int base_addr;
	SetupIntrSystem(&Intc, &base_addr, 61);
	printf("SetupIntr OK\n");

	base_addr = 0xE840;
    printf("START ISA INT TEST 0x%x\n", base_addr);
    TriggerInt( base_addr);
    usleep(1000000);
    printf("END ISA INT TEST 0x%x\n", base_addr);

    base_addr = 0xE880;
    printf("START ISA INT TEST 0x%x\n", base_addr);
    TriggerInt( base_addr);
    usleep(1000000);
    printf("END ISA INT TEST 0x%x\n", base_addr);

    return 0;
}


/////////////////START
//int main( int argc, char *argv[])
//{
//	int wdata_array0[32] = {
//			0,  0, 0, 0, 0, 0, 0, 0, 0x83F,
//			0x1, 0xF19, 0x101, 0xD780, 0x9E30, 0, 0x9F40,
//			0, 0x2710, 0, 0, 0, 0, 0xE000, 0x200,
//			0x40, 0, 0, 0, 0, 0, 0, 0
//	};
//
//	int x;
//	int base_addr;
//
////	base_addr = 0xE840;
//	base_addr = 0xE880;
//    printf("START ISA INT TEST 0x%x\n", base_addr);
//	ISA_FPGA(WRITE, base_addr + 0x6, 0x1234);//0xE846 oxEAC8
//	ISA_FPGA(READ,  base_addr + 0x6, 0x1234);
//
//    ISA_FPGA(WRITE, base_addr, 0x8000);
//    ISA_FPGA(READ, 0xEB00 + 4*2, 0xFFFF);
//    for(x=0; x<32; x++)
//    {
//    	ISA_FPGA(WRITE, base_addr + x*2, wdata_array0[x]);
//    }
//    ISA_FPGA(WRITE, base_addr + 31*2, 0xF000);
//    ISA_FPGA(WRITE, base_addr + 8*2,  0x800);
//
//    ISA_FPGA(WRITE, base_addr + 22*2,  0xE000);
//    ISA_FPGA(WRITE, base_addr + 23*2,   0x200);
//    ISA_FPGA(WRITE, base_addr + 12*2,  0xD780);
//    ISA_FPGA(WRITE, base_addr + 24*2,    0x40);
//    ISA_FPGA(WRITE, base_addr + 24*2,    0x40);
//
//    ISA_FPGA(WRITE, base_addr + 13*2,  0x9E30);
//    ISA_FPGA(WRITE, base_addr + 22*2,  0xE000);
//    ISA_FPGA(WRITE, base_addr + 8*2,    0x800);
//
//    ISA_FPGA(WRITE, base_addr + 15*2,  0x9F40);
//    ISA_FPGA(READ,  0xEB00 + 4*2, 0xFFFF);
//    ISA_FPGA(READ,  base_addr + 1*2, 0);
//    usleep(1000000);
//    ISA_FPGA(WRITE, base_addr + 0*2,   0x2000);
//
//    ISA_FPGA(WRITE, base_addr + 10*2,   0xF32);
//    ISA_FPGA(WRITE, base_addr + 10*2,  0x1932);
//    ISA_FPGA(WRITE, base_addr + 0*2,    0x800);
////    ISA_FPGA(WRITE, 0xEB00 + 1*2,      0x2);//0xE840
//    ISA_FPGA(WRITE, 0xEB00 + 1*2,      0x4);//0xE880
//
//    printf("Wait for INT...\n");
//    usleep(1000000);
////    ISA_FPGA(READ, 0xEB00 + 1*2, 0xFFFD);//0xE840
//    ISA_FPGA(READ, 0xEB00 + 1*2, 0xFFFB);//0xE880
//    ISA_FPGA(WRITE, base_addr, 0x4400);
//    printf("END ISA INT TEST 0x%x\n", base_addr);
//
////    rdata = ISA_FPGA(READ, 0xE846, wdata);
////    printf("RDATA = 0x%x\n", rdata);
//
//    return 0;
//}
/////////////////////END


//int main( int argc, char *argv[])
//{
//	int wdata_array0[32] = {
//			0,  0, 0, 0, 0, 0, 0, 0, 0x83F,
//			0x1, 0xF19, 0x101, 0xD780, 0x9E30, 0, 0x9F40,
//			0, 0x2710, 0, 0, 0, 0, 0xE000, 0x200,
//			0x40, 0, 0, 0, 0, 0, 0, 0
//	};
//
//	int x;
//	int rdata;
//    int wdata;
//
//
//    printf("START ISA INT TEST\n");
//	ISA_FPGA(WRITE, 0xE846, 0x1234);//0xE846 oxEAC8
//	ISA_FPGA(READ, 0xE846, 0x1234);
//
//    ISA_FPGA(WRITE, 0xE840, 0x8000);
//    rdata = ISA_FPGA(READ, 0xEB00 + 4*2, 0xFFFF);
//    for(x=0; x<32; x++)
//    {
//    	ISA_FPGA(WRITE, 0xE840 + x*2, wdata_array0[x]);
//    }
//    ISA_FPGA(WRITE, 0xE840 + 31*2, 0xF000);
//    ISA_FPGA(WRITE, 0xE840 + 8*2,  0x800);
//
//    ISA_FPGA(WRITE, 0xE840 + 22*2,  0xE000);
//    ISA_FPGA(WRITE, 0xE840 + 23*2,   0x200);
//    ISA_FPGA(WRITE, 0xE840 + 12*2,  0xD780);
//    ISA_FPGA(WRITE, 0xE840 + 24*2,    0x40);
//    ISA_FPGA(WRITE, 0xE840 + 24*2,    0x40);
//
//    ISA_FPGA(WRITE, 0xE840 + 13*2,  0x9E30);
//    ISA_FPGA(WRITE, 0xE840 + 22*2,  0xE000);
//    ISA_FPGA(WRITE, 0xE840 + 8*2,    0x800);
//
//    ISA_FPGA(WRITE, 0xE840 + 15*2,  0x9F40);
//    rdata = ISA_FPGA(READ, 0xEB00 + 4*2, 0xFFFF);
//    rdata = ISA_FPGA(READ, 0xE840 + 1*2, 0);
//    usleep(1000000);
//    ISA_FPGA(WRITE, 0xE840 + 0*2,   0x2000);
//
//    ISA_FPGA(WRITE, 0xE840 + 10*2,   0xF32);
//    ISA_FPGA(WRITE, 0xE840 + 10*2,  0x1932);
//    ISA_FPGA(WRITE, 0xE840 + 0*2,    0x800);
//    ISA_FPGA(WRITE, 0xEB00 + 1*2,      0x2);
//
//    printf("Wait for INT...\n");
//    usleep(1000000);
//    rdata = ISA_FPGA(READ, 0xEB00 + 1*2, 0xFFFD);
//    ISA_FPGA(WRITE, 0xE840, 0x4400);
//    printf("END ISA INT TEST\n");
//
////    rdata = ISA_FPGA(READ, 0xE846, wdata);
////    printf("RDATA = 0x%x\n", rdata);
//
//    return 0;
//}

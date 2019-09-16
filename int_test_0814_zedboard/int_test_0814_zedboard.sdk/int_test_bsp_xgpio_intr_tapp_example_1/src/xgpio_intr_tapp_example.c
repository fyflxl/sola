/***************************** Include Files *********************************/

#include "xparameters.h"
#include "xgpio.h"
#include "xil_exception.h"
#include "xscugic.h"
#include "xil_printf.h"

/************************** Constant Definitions *****************************/
#define GPIO_DEVICE_ID		XPAR_GPIO_0_DEVICE_ID
#define GPIO_CHANNEL1		1
#define INTC_GPIO_INTERRUPT_ID	XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR
#define INTC_DEVICE_ID	XPAR_SCUGIC_SINGLE_DEVICE_ID
#define INTC		XScuGic

/************************** Function Prototypes ******************************/
void GpioHandler(void *CallBackRef);

int GpioIntrExample(INTC *IntcInstancePtr, XGpio *InstancePtr,
			u16 DeviceId, u16 IntrId,
			u16 IntrMask);

int GpioSetupIntrSystem(INTC *IntcInstancePtr, void *InstancePtr, u16 IntrId);

void GpioDisableIntr(INTC *IntcInstancePtr, XGpio *InstancePtr,
			u16 IntrId, u16 IntrMask);

/************************** Variable Definitions *****************************/

XGpio Gpio; /* The Instance of the GPIO Driver */
INTC Intc; /* The Instance of the Interrupt Controller Driver */
static u16 GlobalIntrMask; /* GPIO channel mask that is needed by
			    * the Interrupt Handler */
//static volatile u32 IntrFlag; /* Interrupt Handler Flag */


int main(void)
{
	print(" Press button to Generate Interrupt\r\n");

	GpioIntrExample(&Intc, &Gpio, GPIO_DEVICE_ID,
			   INTC_GPIO_INTERRUPT_ID,
			   GPIO_CHANNEL1);

	return XST_SUCCESS;
}


/******************************************************************************/
/**
*
* This is the entry function from the TestAppGen tool generated application
* which tests the interrupts when enabled in the GPIO
* @param	IntrMask is the GPIO channel mask
******************************************************************************/
int GpioIntrExample(INTC *IntcInstancePtr, XGpio* InstancePtr, u16 DeviceId,
			u16 IntrId, u16 IntrMask)
{
	int Status;
	/* Initialize the GPIO driver. If an error occurs then exit */
	Status = XGpio_Initialize(InstancePtr, DeviceId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the GPIO channel interrupts so that push button can be
	 * detected and enable interrupts for the GPIO device
	 */
	XGpio_SetDataDirection(InstancePtr, 1, 0xFFFFFFFF);
	XGpio_InterruptEnable(InstancePtr, IntrMask);
	XGpio_InterruptGlobalEnable(InstancePtr);
	GlobalIntrMask = IntrMask;


	Status = GpioSetupIntrSystem(IntcInstancePtr, InstancePtr, IntrId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	while(1) ;

//	GpioDisableIntr(IntcInstancePtr, InstancePtr, IntrId, IntrMask);

	return Status;
}

int GpioSetupIntrSystem(INTC *IntcInstancePtr, void *InstancePtr, u16 IntrId)
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
				 (Xil_ExceptionHandler)GpioHandler, InstancePtr);
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

void GpioHandler(void *CallbackRef)
{
	XGpio *GpioPtr = (XGpio *)CallbackRef;
//	print("GET INT\r\n");
	XGpio_InterruptDisable(GpioPtr, 1);
	printf("Trigger INT, Read Btn8bit = 0x%x\n", XGpio_DiscreteRead(GpioPtr, 1));
	/* Clear the Interrupt */
	XGpio_InterruptClear(GpioPtr, 1);
	XGpio_InterruptEnable(GpioPtr, 1);

}

void GpioDisableIntr(INTC *IntcInstancePtr, XGpio *InstancePtr,
			u16 IntrId, u16 IntrMask)
{
	XGpio_InterruptDisable(InstancePtr, IntrMask);

	/* Disconnect the interrupt */
	XScuGic_Disable(IntcInstancePtr, IntrId);
	XScuGic_Disconnect(IntcInstancePtr, IntrId);

	return;
}

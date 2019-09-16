
#include "axilite_hw.h"

//void PR_Decoupler(int turn)
//{
//	unsigned long int PhysicalAddress = 0x43c00000;
//	int map_len = 0x60;
//	int fd = open("/dev/mem", O_RDWR);
//
//	unsigned char *xsobel_base_address;
//	xsobel_base_address = (unsigned char *)mmap(NULL, map_len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, (off_t)PhysicalAddress);
//	if(xsobel_base_address == MAP_FAILED)
//	{
//		perror("Sobel Init Mapping memory for absolute memory access failed.\n");
//		return;
//	}
//
//    printf("status: %x\n", ReadReg(xsobel_base_address, 0));
//    printf("turn %d\n", turn);
//
//	WriteReg(xsobel_base_address, 0, turn);
//
//
//    printf("status %d\n", ReadReg(xsobel_base_address, 0));
//
//	munmap((void *)xsobel_base_address, map_len);
//	close(fd);
//}

void AXILITE_HW(unsigned int Value)
{
//	PR_Decoupler(0);
//	sleep(1);
	unsigned long int PhysicalAddress = AXILITE_BASEADDR;
	int map_len = 0x20;
	int fd = open("/dev/mem", O_RDWR);

	unsigned char *xbase_address;
	xbase_address = (unsigned char *)mmap(NULL, map_len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, (off_t)PhysicalAddress);
	if(xbase_address == MAP_FAILED)
	{
		perror("Sobel Init Mapping memory for absolute memory access failed.\n");
		return;
	}

	WriteReg(xbase_address, AXILITE_TEST_S00_AXI_SLV_REG0_OFFSET, Value);
    printf("Read Reg0 %x\n", ReadReg(xbase_address, AXILITE_TEST_S00_AXI_SLV_REG0_OFFSET));


	munmap((void *)xbase_address, map_len);
	close(fd);
}

#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sobel.h"


//Arrays to send and receive data from the accelerator
//AXIS in_pix[MAX_HEIGHT][MAX_WIDTH];
//AXIS out_pix[MAX_HEIGHT][MAX_WIDTH];

int main () {
  int           	x,y;
  int			width, height;
  char *tempbuf;
  char *tempbuf1;
  int check_results = 0;

  tempbuf = (char *)malloc(2000 * sizeof(char));
  tempbuf1 = (char *)malloc(2000 * sizeof(char));


  // Arrays to store image data
  unsigned char *R;
  unsigned char *G;
  unsigned char *B;


  R = (unsigned char *)malloc(MAX_HEIGHT * MAX_WIDTH * sizeof(unsigned char));
  G = (unsigned char *)malloc(MAX_HEIGHT * MAX_WIDTH * sizeof(unsigned char));
  B = (unsigned char *)malloc(MAX_HEIGHT * MAX_WIDTH * sizeof(unsigned char));

  //Get image data from disk
  sprintf(tempbuf, "%s.bmp", INPUT_IMAGE_BASE);

  // Fill a frame with data
  int read_tmp = BMP_Read(tempbuf, MAX_HEIGHT, MAX_WIDTH, R, G, B);
  if(read_tmp != 0) {
    printf("%s Loading image failed\n", tempbuf);
    exit (1);
  }

  hls::stream<AXIS> input_stream("input_stream");
  hls::stream<AXIS> output_stream("output_stream");

  // Copy Input Image to pixel data structure
  // Hardware accelerator works on video pixel streams
   for(x = 0; x < MAX_HEIGHT; x++){
    for(y = 0; y < MAX_WIDTH; y++){
      ap_uint<8> RGB[3];
      ap_uint<32> tmp_32u;
      tmp_32u.range(23, 16) = R[x*MAX_WIDTH + y];
      tmp_32u.range(15, 8) = G[x*MAX_WIDTH + y];
      tmp_32u.range(7, 0) = B[x*MAX_WIDTH + y];
      input_stream.write(tmp_32u);
//      in_pix[x][y].data.range(31, 0) = tmp_32u.range(31, 0);
    }
   }

  // Hardware Function
   sobel_filter(input_stream,output_stream, 1080, 1920);

  // Copy Output video pixel stream to Output Image data structure
	for(x =0; x < MAX_HEIGHT; x++){
		for(y = 0; y < MAX_WIDTH; y++){
			unsigned char RGB[3];
			AXIS tmp_32u;
			tmp_32u = output_stream.read();
			RGB[2] = tmp_32u.range(7,0);
			RGB[1] = tmp_32u.range(15,8);
			RGB[0] = tmp_32u.range(23,16);
			R[x*MAX_WIDTH + y] = RGB[0];
			G[x*MAX_WIDTH + y] = RGB[1];
			B[x*MAX_WIDTH + y] = RGB[2];
		}
	}

  //Write the image back to disk
  sprintf(tempbuf1, "%s.bmp", OUTPUT_IMAGE_BASE);
  int write_tmp = BMP_Write(tempbuf1, MAX_HEIGHT, MAX_WIDTH, R, G, B);
  if(write_tmp != 0){
    printf("WriteBMP %s failed\n", tempbuf);
    exit(1);
  }
  free(R);
  free(G);
  free(B);
  free(tempbuf);
  free(tempbuf1);
  printf("Simulation Complete\n");
  check_results = system("diff result_1080p_golden.bmp result_1080p.bmp");
  if(check_results != 0){
    printf("Output image has mismatches with reference output image!\n");
    check_results = 1;
  }
  else{
    printf("Output image matches the reference output image\n");
  }
  return check_results;
}

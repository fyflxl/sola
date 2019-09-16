#include <stdio.h>
#include "sobel.h"

// RGB to Y Conversion
// Resulting luminance value used in edge detection
unsigned char rgb2y(unsigned char RGB[3])
{
	unsigned char y;
	unsigned short tmp_mul0 = 66 * RGB[0];
	unsigned short tmp_mul1 = 129 * RGB[1];
	unsigned short tmp_mul2 = 25 * RGB[2];
	unsigned short tmp_add0 = tmp_mul0 + tmp_mul1;
	unsigned short tmp_add1 = tmp_mul2 + 128;
	unsigned short tmp_add3 = ((tmp_add0 + tmp_add1) >> 8) + 16;

//	y = ((66 * RGB[0] + 129 * RGB[1] + 25 * RGB[2] + 128) >> 8) + 16;
	return tmp_add3;
}

void sobel_filter(hls::stream<AXIS> &inter_pix,hls::stream<AXIS> &out_pix, int rows, int cols)
{
#pragma HLS INTERFACE axis register both port=out_pix
#pragma HLS INTERFACE axis register both port=inter_pix
#pragma HLS INTERFACE s_axilite register port=return bundle=CTRL_BUS
#pragma HLS INTERFACE s_axilite register port=rows bundle=CTRL_BUS
#pragma HLS INTERFACE s_axilite register port=cols bundle=CTRL_BUS

	int PIXNUM = rows*cols;
	int x;
  for(x = 0; x < PIXNUM; x++){
#pragma HLS PIPELINE II=1

		unsigned char new_pix[3];
#pragma HLS ARRAY_PARTITION variable=new_pix complete dim=1
		unsigned char gray;
		ap_uint<32> input_pixel;
		input_pixel = inter_pix.read();
		new_pix[2] = input_pixel.range(7, 0);
		new_pix[1] = input_pixel.range(15,8);
		new_pix[0] = input_pixel.range(23,16);
		gray = rgb2y(new_pix);

		ap_uint<32> output_pixel;
		output_pixel.range( 7,  0) = gray;
		output_pixel.range(15,  8) = gray;
		output_pixel.range(23, 16) = gray;
		output_pixel.range(31, 24) = 0xff;
		out_pix.write(output_pixel);

    }
}

////Sobel Computation using a 3x3 neighborhood
//void sobel_operator(unsigned char window[9], unsigned char RGB[3])
//{
//  short x_weight = 0;
//  short y_weight = 0;
//
//  short edge_weight;
//  unsigned char edge_val;
//
//  char i;
//  char j;
//
//
//  const char x_op[3][3] = { {-1,0,1},
//			    {-2,0,2},
//			    {-1,0,1}};
//
//  const char y_op[3][3] = { {1,2,1},
//			    {0,0,0},
//			    {-1,-2,-1}};
//
//  //Compute approximation of the gradients in the X-Y direction
//  for(i=0; i < 3; i++){
//    for(j = 0; j < 3; j++){
//
//      // X direction gradient
//      x_weight = x_weight + (window[i*3+j] * x_op[i][j]);
//
//      // Y direction gradient
//      y_weight = y_weight + (window[i*3+j] * y_op[i][j]);
//    }
//  }
//
//  edge_weight = ABS(x_weight) + ABS(y_weight);
//
//  if(edge_weight > 255)
//	  edge_val = 0;
//  else
//	  edge_val = (255-(unsigned char)(edge_weight));
//
//  //Edge thresholding
//  if(edge_val > 200)
//    edge_val = 255;
//  else if(edge_val < 100)
//    edge_val = 0;
//
//  RGB[0] = edge_val;
//  RGB[1] = edge_val;
//  RGB[2] = edge_val;
//
//}
//
////Main function for Sobel Filtering
////This function includes a line buffer for a streaming implementation
//void sobel_filter(AXIS inter_pix[MAX_HEIGHT][MAX_WIDTH],AXIS out_pix[MAX_HEIGHT][MAX_WIDTH], int rows, int cols)
//{
//  int row;
//  int col;
//
//  unsigned char buff_A[3][MAX_WIDTH];
////  RGB_BUFFER buff_B;
//  unsigned char buff_C[9];
//
//  for(row = 0; row < rows+1; row++){
//    for(col = 0; col < cols+1; col++){
////#pragma AP loop_flatten off
////#pragma AP dependence variable=&buff_A false
////#pragma AP PIPELINE II = 1
//
//      // Temp values are used to reduce the number of memory reads
////      unsigned char temp;
////      unsigned char test_val;
////      unsigned char tempx;
//
//      //Line Buffer fill
//		if(col < cols){
////			buff_A.shift_up(col);
//			int x;
//			for(x=2; x>0; x--)
//			{
//				buff_A[x-1][col] = buff_A[x][col];
//			}
////			temp = buff_A[0][col];
//		}
//
//      //There is an offset to accomodate the active pixel region
//      //There are only MAX_WIDTH and MAX_HEIGHT valid pixels in the image
//		if(col < cols & row < rows){
//			unsigned char new_pix[3];
//			ap_uint<32> input_pixel;
//			input_pixel.range(31, 0) = inter_pix[row][col].data.range(31, 0);
//			new_pix[2] = input_pixel.range(7, 0);
//			new_pix[1] = input_pixel.range(15,8);
//			new_pix[0] = input_pixel.range(23,16);
////			tempx = rgb2y(new_pix);
//			buff_A[2][col] = rgb2y(new_pix);
//		}
//
//      //Shift the processing window to make room for the new column
//		int x,y;
//		for(y=0; y<3; y++)
//			for(x=2; x>0; x--)
//			{
//				buff_C[y*3+x-1] = buff_C[y*3+x];
//			}
////      buff_C.shift_right();
//
//      //The Sobel processing window only needs to store luminance values
//      //rgb2y function computes the luminance from the color pixel
//		if(col < cols){
//			buff_C[0*3 + 2] = buff_A[0][col];
//			buff_C[1*3 + 2] = buff_A[1][col];
//			buff_C[2*3 + 2] = buff_A[2][col];
//		}
//		unsigned char edge[3];
//
//      //The sobel operator only works on the inner part of the image
//      //This design assumes there are no edges on the boundary of the image
//      if( row <= 1 || col <= 1 || row > (rows-1) || col > (cols-1)){
//    	  edge[0] = edge[1] = edge[2] = 0;
//      }
//      else{
//	//Sobel operation on the inner portion of the image
//    	  sobel_operator(buff_C,edge);
////    	  printf("edge[0,1,2]=%4d;%4d;%4d\n",edge[0],edge[1],edge[2]);
//      }
//
//      //The output image is offset from the input to account for the line buffer
//      if(row > 0 && col > 0){
//		AXIS output_pixel;
//		ap_uint<8> padding = 0xff;
//		ap_uint<8> tmp_uint8[3];
//		tmp_uint8[0].range(7, 0) = edge[0];
//		tmp_uint8[1].range(7, 0) = edge[1];
//		tmp_uint8[2].range(7, 0) = edge[2];
//		output_pixel.data = (tmp_uint8[0],tmp_uint8[1]);
//		output_pixel.data = (output_pixel.data, tmp_uint8[2]);
//		output_pixel.data = (padding,output_pixel.data);
//		if((col == cols))
//			output_pixel.last = 1;
//		else
//			output_pixel.last = 0;
//		out_pix[row-1][col-1] = output_pixel;
//      }
//    }
//  }
//}

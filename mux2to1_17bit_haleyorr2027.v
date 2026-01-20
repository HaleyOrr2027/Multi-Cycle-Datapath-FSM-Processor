////////////////////////////////////////////////////////////////////////////////
//
// Filename: mux2to1_17bit_haleyorr2027.v
// Author: Haley Orr
// Date: 8 December 2025
//
// Description:
// 2x1 mux for the multiplication operation. Created in HW8.
//
////////////////////////////////////////////////////////////////////////////////

module mux2to1_17bit_haleyorr2027(select, in0, in1, out);
   input         select;
   input  [16:0] in0, in1;
   output [16:0] out;
	
	assign out = (select == 1'b0) ? in0 : in1;

endmodule

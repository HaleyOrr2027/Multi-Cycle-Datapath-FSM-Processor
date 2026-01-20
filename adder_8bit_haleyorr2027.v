////////////////////////////////////////////////////////////////////////////////
// Filename: adder_8bit_haleyorr2027.v
// Author:   Haley Orr
// Date:     8 December 2025
//
// Description:
// 8-bit  adder used in the multiplier.
// Adds two 8-bit operands and produces an 8-bit sum and carry-out.
//
////////////////////////////////////////////////////////////////////////////////



module adder_8bit_haleyorr2027(a, b, cout, sum);
   input  [7:0] a, b;
   output       cout;
   output [7:0] sum;

    wire [8:0] result;

    assign result = a + b;

    assign sum  = result[7:0];
    assign cout = result[8];

endmodule

////////////////////////////////////////////////////////////////////////////////
//
// Filename: shiftreg_17bit_haleyorr2027.v
// Author: Haley Orr
// Date: 8 December 2025
//
// Description:
// 17-bit shift  used by the multiplier.
// Single-bit right shift operations.
//
////////////////////////////////////////////////////////////////////////////////

module shiftreg_17bit_haleyorr2027(clock, reset_n, load, shift, ins, outs);
   input         clock;     // Register clock
   input         reset_n;   // Active-low reset
   input         load;      // Active-high load enable
   input         shift;     // Active-high shift-RIGHT control;
   input  [16:0] ins;       // Parallel load inputs
   output reg [16:0] outs;      // Register state
	
	
	always @(posedge clock, negedge reset_n) begin
		 if (!reset_n)
			  outs <= 17'b0;

		 else if (load)
			  outs <= ins;

		 else if (shift)
			  outs <= outs >> 1;  //shift
	end

endmodule
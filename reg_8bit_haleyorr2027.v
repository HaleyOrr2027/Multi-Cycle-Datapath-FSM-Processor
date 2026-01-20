////////////////////////////////////////////////////////////////////////////////
//
// Filename: reg_8bit_haleyorr2027.v
// Author: Haley Orr
// Date: 8 December 2025
//
// Description:
// This acts as a register for a 8-bit number.
//
////////////////////////////////////////////////////////////////////////////////


module reg_8bit_haleyorr2027(clock, reset_n, load, ins, outs);
   input        clock;     // Register clock
   input        reset_n;   // Active-low reset
   input        load;      // Active-high load enable
   input  [7:0] ins;       // Parallel load inputs
   output reg [7:0] outs;      // Register state
	
	always @(posedge clock, negedge reset_n) begin
		if (!reset_n)
        outs <= 8'b00000000; //Do this bc of the "negedge reset_n" in always statement
      else if (load)
        outs <= ins;
	end

	
endmodule
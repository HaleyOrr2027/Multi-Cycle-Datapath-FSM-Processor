///////////////////////////////////////////////////////////////////////////
// Filename: reg_16bit_haleyorr2027.v
// Author:   Haley Orr
// Date:     2025
// Description: 16-bit synchronous register with active-low reset
//              Stores final result for display in Project 5.
///////////////////////////////////////////////////////////////////////////

module reg_16bit_haleyorr2027(clock,reset_n,load,ins, outs);
    input         clock;     // Register clock
    input         reset_n;   // Active-low reset
    input         load;      // Active-high load enable
    input  [15:0] ins;       // Parallel load input
    output reg [15:0] outs;  // Register output

    always @(posedge clock, negedge reset_n) begin
        if (!reset_n)
            outs <= 16'b0000000000000000;
        else if (load)
            outs <= ins;
    end

endmodule

///////////////////////////////////////////////////////////////////////////
// Filename: reg_4bit_haleyorr2027.v
// Author:   Haley Orr
// Date:     2025
// Description: 4-bit synchronous register with active-low reset
//              Used for storing the ALU opcode in Project 5.
///////////////////////////////////////////////////////////////////////////

module reg_4bit_haleyorr2027(clock, reset_n,load, ins, outs);
    input        clock;       // Register clock
    input        reset_n;     // Active-low reset
    input        load;        // Active-high load enable
    input  [3:0] ins;         // Parallel load input
    output reg [3:0] outs;    // Register state

    always @(posedge clock, negedge reset_n) begin
        if (!reset_n)
            outs <= 4'b0000;
        else if (load)
            outs <= ins;
    end

endmodule

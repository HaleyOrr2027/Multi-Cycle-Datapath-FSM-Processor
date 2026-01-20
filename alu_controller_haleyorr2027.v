////////////////////////////////////////////////////////////////////////////////
// Filename: alu_controller_haleyorr2027.v
// Author:   Haley Orr
// Date:     8 December 2025
//
// Description:
// Steps through all states using an ENTER signal and
// then creates load enables for the opcode, operand, and result registers.
// Note that single-operand instructions (NEG, NOT) skip the OpB state.
//
////////////////////////////////////////////////////////////////////////////////

module alu_controller_haleyorr2027(clock, reset_n, enter, opcode,
                                   loadOp, loadA, loadB, loadOut);

    input        clock;
    input        reset_n;
    input        enter;
    input  [3:0] opcode;

    output reg loadOp;
    output reg loadA;
    output reg loadB;
    output reg loadOut;

    parameter OPCODE = 3'd0,
              OP_A   = 3'd1,
              OP_B   = 3'd2,
              OUT    = 3'd3;

    reg [2:0] current_state;
    reg [2:0] next_state;

	 //USed for when operation uses only operand A (NEG or NOT);
    wire using_one_only;
    assign using_one_only = (opcode == 4'b0010) || (opcode == 4'b0111);

    // Next-state logic
    always @(*) begin
        next_state = current_state;

        case (current_state)

            OPCODE: if (enter) next_state = OP_A;

            OP_A:   if (enter)
                        if (using_one_only)
                            next_state = OUT;
                        else
                            next_state = OP_B;

            OP_B:   if (enter) next_state = OUT;

            OUT:    if (enter) next_state = OPCODE;

            default: next_state = OPCODE;

        endcase
    end

    // Output
    always @(*) begin

        loadOp  = 1'b0;
        loadA   = 1'b0;
        loadB   = 1'b0;
        loadOut = 1'b0;

        case (current_state)
            OPCODE: loadOp  = 1'b1;
            OP_A:   loadA   = 1'b1;
            OP_B:   loadB   = 1'b1;
            OUT:    loadOut = 1'b1;
        endcase

    end

    always @(posedge clock or negedge reset_n) begin
        if (!reset_n)
            current_state <= OPCODE;
        else
            current_state <= next_state;
    end

endmodule

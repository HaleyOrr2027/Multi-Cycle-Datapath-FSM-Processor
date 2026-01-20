////////////////////////////////////////////////////////////////////////////////
// Filename: alu_core_haleyorr2027.v
// Author:  Haley Orr
// Date:    8 December 2025
//
// Description:
// 16-bit ALU core.
// Performs various operations based on opcode. Operands A and B are 
// 8-bit values and are sign-extended to 16 bits.
//
////////////////////////////////////////////////////////////////////////////////

module alu_core_haleyorr2027(clock, reset_n, opcode, opA, opB, core_out);

    input        clock;
    input        reset_n;
    input  [3:0] opcode;
    input  [7:0] opA;
    input  [7:0] opB;
    output reg [15:0] core_out;

    reg [15:0] A_extended;
    reg [15:0] B_extended;
    reg [15:0] temp16bit;

    // Student ID
    parameter STUDENT_ID = 16'h4813; //ID is 4813
	 integer i;

    always @(*) begin

        // Sign extension

        // Extend A
        if (opA[7] == 1'b1)
            A_extended = {8'hFF, opA};
        else
            A_extended = {8'h00, opA};

        // Extend B
        if (opB[7] == 1'b1)
            B_extended = {8'hFF, opB};
        else
            B_extended = {8'h00, opB};

        core_out  = 16'h0000;
		  
		 //This acts as a temporary holder for the value while calculations
		 // are being done on it and it shouldn't be displayed on board. Like a scratchpad.
        temp16bit = 16'h0000;

        case (opcode)

            //ADD
            4'b0000:
                core_out = A_extended + B_extended;

            //SUB
            4'b0001:
                core_out = A_extended - B_extended;

            //NEGATE
            4'b0010:
                core_out = ~A_extended + 16'h0001;

            //AND
            4'b0100:
                core_out = {8'h00, (opA & opB)};

            //OR
            4'b0101:
                core_out = {8'h00, (opA | opB)};

            //XOR
            4'b0110:
                core_out = {8'h00, (opA ^ opB)};

            //NOT
            4'b0111:
                core_out = {8'h00, (~opA)};

            //Circular Shift Right
            4'b1000: begin
                temp16bit = {8'h00, opA};
                for (i = 0; i < opB[3:0]; i = i + 1)
                    temp16bit = { temp16bit[0], temp16bit[15:1] };
                core_out = temp16bit;
            end

            //Circular Shift Left
            4'b1001: begin
                temp16bit = {8'h00, opA};
                for (i = 0; i < opB[3:0]; i = i + 1)
                    temp16bit = { temp16bit[14:0], temp16bit[15] };
                core_out = temp16bit;
            end

            //Arithmetic Shift Left
            4'b1010: begin
                temp16bit = A_extended;
                for (i = 0; i < opB[3:0]; i = i + 1)
                    temp16bit = { temp16bit[14:0], 1'b0 };
                core_out = temp16bit;
            end

            //Arithmetic Shift Right
            4'b1011: begin
                temp16bit = A_extended;
                for (i = 0; i < opB[3:0]; i = i + 1)
                    temp16bit = { temp16bit[15], temp16bit[15:1] };
                core_out = temp16bit;
            end

            //AND with Student ID
            4'b1100: begin
                temp16bit = {opA, opB};
                core_out  = temp16bit & STUDENT_ID;
            end

            //MULTIPLY
            4'b0011: begin
                temp16bit = 16'h0000;
                for (i = 0; i < 8; i = i + 1)
                    if (opB[i])
                        temp16bit = temp16bit + ({8'h00, opA} << i);
                core_out = temp16bit;
            end

            default:
                core_out = 16'h0000;

        endcase

    end

endmodule

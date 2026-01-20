////////////////////////////////////////////////////////////////////////////////
//
// Filename: project5Top.v
// Author: Haley Orr
// Date: 8 December 2025
//
// Description:
// Top-level module for ECE 3544 Project 5 
//
////////////////////////////////////////////////////////////////////////////////

module project5Top(CLOCK_50, KEY, SW, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, LED);

    input        CLOCK_50;
    input  [3:0] KEY;
    input  [9:0] SW;
    output [6:0] HEX5;
    output [6:0] HEX4;
    output [6:0] HEX3;
    output [6:0] HEX2;
    output [6:0] HEX1;
    output [6:0] HEX0;
    output [9:0] LED;
	 
    wire enter;
    wire loadOp;
    wire loadA;
    wire loadB;
    wire loadOut;
    wire [3:0]  opcode;
    wire [7:0]  opA;
    wire [7:0]  opB;
    wire [15:0] alu_result;
    wire [15:0] result;

    keypress ENTER_KEY(CLOCK_50, KEY[1], KEY[0], enter);

    alu_controller_haleyorr2027 alu_controller(CLOCK_50, KEY[1], enter, opcode, loadOp, loadA, loadB, loadOut);

    reg_4bit_haleyorr2027 opcode_reg(CLOCK_50, KEY[1], loadOp, SW[3:0], opcode);

    reg_8bit_haleyorr2027 a_reg(CLOCK_50, KEY[1], loadA, SW[7:0], opA);

    reg_8bit_haleyorr2027 b_reg(CLOCK_50, KEY[1], loadB, SW[7:0], opB);

    alu_core_haleyorr2027 alu_core(CLOCK_50, KEY[1], opcode, opA, opB, alu_result);

    reg_16bit_haleyorr2027 result_reg(CLOCK_50, KEY[1], loadOut, alu_result, result);

    sevenSegDecoder HEX_0(result[3:0],   HEX0);
    sevenSegDecoder HEX_1(result[7:4],   HEX1);
    sevenSegDecoder HEX_2(result[11:8],  HEX2);
    sevenSegDecoder HEX_3(result[15:12], HEX3);

    assign HEX4 = 7'b1111111;
    assign HEX5 = 7'b1111111;
    assign LED  = 10'b0000000000;

endmodule

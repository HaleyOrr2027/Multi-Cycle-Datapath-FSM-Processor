////////////////////////////////////////////////////////////////////////////////
// Testbench: tb_project5Top_haleyorr2027
// Author: Haley Orr
// Date:   8 December 2025
//
// Description:
// Testbench for top module of Project 5.
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns

module tb_project5Top_haleyorr2027;
    reg        CLOCK_50;
    reg [3:0]  KEY;
    reg [9:0]  SW;
    wire [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
    wire [9:0] LED;

    // Instantiate DUT
    project5Top DUT (CLOCK_50, KEY, SW, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, LED);

    // Clock
    always #10 CLOCK_50 = ~CLOCK_50;
	 
	 initial begin

        // Initialization
        CLOCK_50 = 0;
        KEY = 4'b1111;
        SW  = 10'b0;

        // Reset
        KEY[1] = 0;
        #40;
        KEY[1] = 1;
        #40;

        // ADD: 10 + 5 = 15 (000F)
        SW[3:0] = 4'b0000;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'd10;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'd5;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;


        // SUB: 7 - 12 = -5 (FFFB)
        SW[3:0] = 4'b0001;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'd7;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'd12;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;


        // NEG: 9 > -9  (FFF7)
        SW[3:0] = 4'b0010;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'd9;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;


        // XOR: AA ^ 0F = 00A5
        SW[3:0] = 4'b0110;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'hAA;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'h0F;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;


        // MULT 3 * 5 = 002D
        SW[3:0] = 4'b0011;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'd3;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'd5;
        KEY[0] = 0; #20; KEY[0] = 1; #40;
		  
		  // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;
		  
		  
		  // AND: AA & 0F = 0A
        SW[3:0] = 4'b0100;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'hAA;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'h0F;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;


        // OR: 51 | 0F = 5F
        SW[3:0] = 4'b0101;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'h51;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'h0F;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // NOT: ~55 = AA
        SW[3:0] = 4'b0111;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'h55;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;


        // CIRCULAR SHIFT RIGHT:
        // A = 81 >> 3 = 30
        SW[3:0] = 4'b1000;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'h81;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'd3;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;


        // CIRCULAR SHIFT LEFT:
        // A = 81 << 2 = 06
        SW[3:0] = 4'b1001;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'h81;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'd2;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;


        // ARITHMETIC SHIFT LEFT:
        // A = F0 << 2 = C0
        SW[3:0] = 4'b1010;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'hF0;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'd2;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;


        // ARITHMETIC SHIFT RIGHT:
        // A = F0 >> 2 = FC
        SW[3:0] = 4'b1011;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'hF0;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'd2;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        // Return FSM to OPCODE
        KEY[0] = 0; #20; KEY[0] = 1; #40;


        // ID AND
        // {AB} & STUDENT_ID
        // A=48 B=13 => 0x4813 & 0x4813 = 0x4813
        SW[3:0] = 4'b1100;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'h48;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        SW[7:0] = 8'h13;
        KEY[0] = 0; #20; KEY[0] = 1; #40;

        

        #200;
        $stop;

    end

endmodule

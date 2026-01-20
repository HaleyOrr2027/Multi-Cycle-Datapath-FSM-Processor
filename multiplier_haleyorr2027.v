////////////////////////////////////////////////////////////////////////////////
// Filename: multiplier_haleyorr2027.v
// Author:   Haley Orr
// Date:     8 December 2025
//
// Description:
// Uses a 17-bit register, 8-bit adder, 2x1 mux, and controller FSM
// to  find the unsigned product. 
//
////////////////////////////////////////////////////////////////////////////////

module multiplier_haleyorr2027(clock, reset_n, bus, multiplicand, product);
   input         clock;          // System clock
   input         reset_n;        // System active-low reset
   input   [7:0] bus;            // The system input bus
   output  [7:0] multiplicand;   // Multiplicand register output
   output [15:0] product;        // Product register 16 LSBs

   // Control
   wire select;
   wire loadA;
   wire loadB;
   wire shift;

   //datapath
   wire [16:0] product_reg;

   wire [7:0] sum;
   wire cout;

   wire [16:0] mux_in0;
   wire [16:0] mux_in1;
   wire [16:0] mux_out;

   reg_8bit_haleyorr2027 mulcand_reg (clock, reset_n, loadA, bus, multiplicand);
	
   adder_8bit_haleyorr2027 adder(multiplicand, product_reg[15:8], cout, sum);

   // Load from bus
   assign mux_in0[16:8] = 9'b0;
   assign mux_in0[7:0]  = bus;

   assign mux_in1 = product_reg[0] ? {cout, sum, product_reg[7:0]} : product_reg;

   mux2to1_17bit_haleyorr2027 mux(select, mux_in0, mux_in1, mux_out);

   shiftreg_17bit_haleyorr2027 shift_reg(clock, reset_n,loadB, shift, mux_out, product_reg);

   multiply_controller_haleyorr2027 controller(clock, reset_n, product_reg[0], select, loadA, loadB, shift);

   assign product = product_reg[15:0];

endmodule

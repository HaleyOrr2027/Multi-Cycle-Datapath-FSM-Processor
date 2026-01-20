////////////////////////////////////////////////////////////////////////////////
//
// Filename: multiply_controller_haleyorr2027.v
// Author: Haley Orr
// Date: 8 December 2025
//
// Description:
// This is the controller for the FSM of the multiplication operation. Made in HW8.
//
////////////////////////////////////////////////////////////////////////////////



module multiply_controller_haleyorr2027(clock, reset_n, lsb, select, loadA, loadB, shift);
   input  clock;     // FSM clock
   input  reset_n;   // Active-low reset;
   input  lsb;       // The lsb of the multiplier register
   output reg select;    // The control value for the mux select
   output reg loadA;     // The control value for the multiplicand load
   output reg loadB;     // The control value for the product register load
   output reg  shift;     // The control value for the product register shift

   // states
   parameter INIT_A = 2'd0,
             INIT_B = 2'd1,
             LOAD   = 2'd2,
             SHIFT  = 2'd3;

   reg [1:0] state;

   reg [2:0] count;

   always @(posedge clock, negedge reset_n) begin
	
    if (!reset_n) begin
        state <= INIT_A;
        count <= 3'd0;
    end else begin
        case(state)

            INIT_A:
                state <= INIT_B;

            INIT_B: begin
                count <= 3'd0;
                state <= LOAD;
            end

            LOAD:
                state <= SHIFT;

            SHIFT: begin
					 if (count == 3'd7) begin
						  state <= INIT_A;   // finished
						  count <= 3'd0; // reset for next numbers
					 end else begin
						  count <= count + 1'b1;
						  state <= LOAD;
					 end
				end


        endcase
    end
end



   // Output
   always @(*) begin

      // defaults
      select = 1'b0;
      loadA  = 1'b0;
      loadB  = 1'b0;
      shift  = 1'b0;

      case(state)

         // Load multiplicand
         INIT_A: begin
            loadA = 1'b1;
         end

         // Load multiplier
         INIT_B: begin
            select = 1'b0;
            loadB  = 1'b1;
         end

         LOAD: begin
            select = 1'b1;
            loadB  = 1'b1;
         end

         SHIFT: begin
            shift = 1'b1;
         end

      endcase

   end

endmodule

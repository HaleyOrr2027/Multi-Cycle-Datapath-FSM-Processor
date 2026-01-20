///////////////////////////////////////////////////////////////////////////
// Filename sevenSegDecoder.v
// Author: Haley Orr
// Date: 21 Nov. 2025
// Description: This is a seven-segment decoder.
// It displays numbers 0-9 on the hex display.
///////////////////////////////////////////////////////////////////////////

module sevenSegDecoder(hex_digit, hex_display);
   input  [3:0] hex_digit;
   output reg [6:0] hex_display;
	
   always @(*) begin
      case (hex_digit)
         4'h0: hex_display = 7'b0111111; // 0
         4'h1: hex_display = 7'b0000110; // 1
         4'h2: hex_display = 7'b1011011; // 2
         4'h3: hex_display = 7'b1001111; // 3
         4'h4: hex_display = 7'b1100110; // 4
         4'h5: hex_display = 7'b1101101; // 5
         4'h6: hex_display = 7'b1111101; // 6
         4'h7: hex_display = 7'b0000111; // 7
         4'h8: hex_display = 7'b1111111; // 8
         4'h9: hex_display = 7'b1100111; // 9
         4'hA: hex_display = 7'b1110111; // A
         4'hB: hex_display = 7'b1111100; // B
         4'hC: hex_display = 7'b0111001; // C
         4'hD: hex_display = 7'b1011110; // D
         4'hE: hex_display = 7'b1111001; // E
         4'hF: hex_display = 7'b1110001; // F
      endcase
		hex_display = ~hex_display;
   end

endmodule
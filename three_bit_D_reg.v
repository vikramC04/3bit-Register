module three_bit_D_reg (SW, LEDR, KEY);
	input [9:0] SW;
	input [3:0] KEY;
	output [9:0] LEDR;
	wire b3, b2, b1, Button;
	wire [2:0] D;
   wire [2:0] Q;
	assign Button = KEY[0];	
	assign Resetn = KEY[1];ii
	
	assign b3 = SW[9];
	assign b2 = SW[8];
	assign b1 = SW[7];
	assign D = {b3, b2, b1};
	
	regne name (D, Button, Resetn, Q);
	
	assign LEDR[9] = Q[2];
	assign LEDR[8] = Q[1];
	assign LEDR[7] = Q[0];

endmodule




module regne (D, Clock, Resetn, Q);
	input [2:0] D;
	input Clock, Resetn;
	output reg [2:0] Q;
	always @(posedge Clock, negedge Resetn)
		if (Resetn == 0)
			Q <= 3'b000;
		else
			Q <= D;
endmodule
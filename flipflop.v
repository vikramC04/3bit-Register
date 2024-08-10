module flipflop (KEY, LEDR, SW);
	input [9:0] SW;
	input [3:0] KEY;
	output [9:0] LEDR;
	wire D, Clock, Q;
	
	assign D = SW[9];
	assign Clock = KEY[0] & KEY[1] & KEY[2] & KEY[3];
	dflipflop name (D, Clock, Q);
	
	assign LEDR[9] = Q;

endmodule




module dflipflop (D, Clock, Q);
	input D, Clock;
	output reg Q;
	
	always @(posedge Clock)
		Q <= D;
endmodule	

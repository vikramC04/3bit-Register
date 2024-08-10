module lab2demo(SW, HEX5, HEX4);
	input [9:0] SW;
	output [6:0] HEX5;
	output [6:0] HEX4;
	wire h3, h2, h1, h0, n3, n2, n1, n0, f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13;

	assign h3 = SW[9];
	assign h2 = SW[8];
	assign h1 = SW[7];
	assign h0 = SW[5];
	
	assign n3 = SW[4];
	assign n2 = SW[3];
	assign n1 = SW[2];
	assign n0 = SW[1];
	
	hexdisp P1 (h3, h2, h1, h0, f0, f1, f2, f3, f4, f5, f6);
	name P2 (n3, n2, n1, n0, f7, f8, f9, f10, f11, f12, f13);
	
	assign HEX5[0] = f0;
	assign HEX5[1] = f1;
	assign HEX5[2] = f2;
	assign HEX5[3] = f3;
	assign HEX5[4] = f4;
	assign HEX5[5] = f5;
	assign HEX5[6] = f6;
	
	assign HEX4[0] = f7;
	assign HEX4[1] = f8;
	assign HEX4[2] = f9;
	assign HEX4[3] = f10;
	assign HEX4[4] = f11;
	assign HEX4[5] = f12;
	assign HEX4[6] = f13;
	
	
endmodule


module hexdisp (x3, x2, x1, x0, f0, f1, f2, f3, f4, f5, f6);
	input x3, x2, x1, x0;
	output f0, f1, f2, f3, f4, f5, f6;
	assign f0 = ~((~x2 & ~x0) | (~x3 & x1) | (x2 & x1) | (x3 & ~x0) | (~x3 & x2 & x0) | (x3 & ~x2 & ~x1));
	assign f1 = ~((~x3 & ~x2) | (~x2 & ~x0) | (~x3 & x1 & x0) | (~x3 & ~x1 & ~x0) | (x3 & ~x1 & x0));
	assign f2 = ~((~x3 & x0) | (~x3 & ~x1) | (~x3 & x2) | (~x1 & x0) | (x3 & ~x2));
	assign f3 = ~((x2 | x1 | ~x0) & (~x2 | ~x1 | ~x0) & (x3 | ~x2 | x1 | x0) & (~x3 | x2 | ~x1 | x0)); 
	assign f4 = ~((x3 | ~x0) & (x3 | ~x2 | x1) & (x2 | x1 | ~x0));
	assign f5 = ~((x3 | x2 | ~x0) & (x3 | x2 | ~x1) & (x3 | ~x1 | ~x0) & (~x3 | ~x2 | x1 | ~x0));
	assign f6 = ~((x3 | x2 | x1) & (x3 | ~x2 | ~x1 | ~x0) & (~x3 | ~x2 | x1 | x0));
endmodule


module name (x3, x2, x1, x0, f0, f1, f2, f3, f4, f5, f6);
	input x3, x2, x1, x0;
	output f0, f1, f2, f3, f4, f5, f6;
	assign f0 = (x3 | x2 | x0) & (~x2 | x1 | ~x0);
	assign f1 = (~x2 & ~x1) | (~x2 & x0);
	assign f2 = (~x2 & ~x1 & ~x0);
	assign f3 = (x1 | x0) & (~x1 | x0 | ~x2);
	assign f4 = 0;
	assign f5 = (x2 & ~x1 & ~x0) | (~x2 & x1 & x0);
	assign f6 = (~x2 & ~x1 & ~x0) | (~x3 & x2 & x1 & ~x0);
endmodule
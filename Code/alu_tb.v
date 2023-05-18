`include "alu.v"

module alu_tb;
// Inputs
reg [31:0] input_1;
reg [31:0] input_2;
reg [1:0] alu_control;
// Outputs
wire [31:0] alu_result;
// Instantiate the Unit Under Test (UUT)
alu uut (
.input_1(input_1),
.input_2(input_2),
.alu_control(alu_control),
.alu_result(alu_result)
);
initial begin
     input_1 = 23;     input_2 = 42; alu_control = 2'b00;
 #20 input_1 = 23; input_2 = 42; alu_control = 2'b01;
 #20 input_1 = 23; input_2 = 42; alu_control = 2'b10;
 #20 input_1 = 23; input_2 = 42; alu_control = 2'b11;
 end
 // Finish after 150 clock cycles
 initial
 #300 $finish;
endmodule
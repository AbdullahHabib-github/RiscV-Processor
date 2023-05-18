`include "instruction_memory.v"

module instruction_memory_tb;
// Inputs
reg [9:0] PC;
reg reset;
// Outputs
wire [31:0] Instruction_Code;
// Instantiate the Unit Under Test (UUT)
instruction_memory uut (
.PC(PC),
.reset(reset),
.Instruction_Code(Instruction_Code)
);
initial
 begin
    reset = 1'b0;
    #20 reset= 1'b1;
    #20 PC = 32'd0;
    #20 PC = 32'd4;
    #20 PC = 32'd8;
    #20 PC = 32'd12;
    #20 PC = 32'd16;
    #20 PC = 32'd20;
    #20 PC = 32'd24;
    #20 PC = 32'd28;
    #20 PC = 32'd32;
    #20 PC = 32'd36;
    #20 PC = 32'd40;
    #20 PC = 32'd44;
    #20 PC = 32'd48;
    #20 PC = 32'd52;
 end
 // Terminating after 150 clock cycles
 initial
 #250 $finish;
endmodule
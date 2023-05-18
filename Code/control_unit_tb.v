`include "control_unit.v"

module control_unit_tb;

// Inputs
reg [6:0] opcode;
// Outputs
wire Branch;
wire MemRead;
wire MemtoReg;
wire [1:0] ALUOp;
wire MemWrite;
wire ALUSrc;
wire RegWrite;
wire JAL;
wire JALR;

// Instantiate the Unit Under Test (UUT)
control_unit_tb uut (
    .opcode(opcode), 
    .Branch(Branch), 
    .MemRead(MemRead), 
    .MemtoReg(MemtoReg), 
    .ALUOp(ALUOp), 
    .MemWrite(MemWrite), 
    .ALUSrc(ALUSrc), 
    .RegWrite(RegWrite),
    .JAL(JAL),
    .JALR(JALR) 
);

initial begin
    opcode = 7'b0110011;
    #100;
    opcode = 7'b0000011;
    #100;
    opcode = 7'b0100011;
    #100;
    opcode = 7'b1100011;
    #100;
    opcode = 7'b0010011;
    #100;
    opcode = 7'b1101111;
    #100;
    opcode = 7'b1100111;
    #100;
end
endmodule


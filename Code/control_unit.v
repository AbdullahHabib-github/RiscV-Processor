module control_unit(
 input [6:0] opcode,
 output reg Branch,
 output reg MemRead,
 output reg MemtoReg,
 output reg [1:0] ALUOp,
 output reg MemWrite,
 output reg ALUSrc,
 output reg RegWrite,
 output reg JAL,
 output reg JALR    
);

parameter Rtype =  7'b0110011;
parameter Load =   7'b0000011;
parameter Store =  7'b0100011;
parameter Btype = 7'b1100011;
parameter Addi =   7'b0010011;
parameter Jal =    7'b1101111;
parameter Jalr =   7'b1100111;

always @(*) begin
case (opcode)
    Rtype: begin
        { Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, JAL, JALR } = 10'b0001000100;
    end
    Load: begin
        { Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, JAL, JALR } = 10'b0110001100;
    end
    Store: begin
        { Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, JAL, JALR } = 10'b00x0011000;
    end
    Btype: begin
        { Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, JAL, JALR } = 10'b10x0100000;
    end
    Addi: begin
        { Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, JAL, JALR } = 10'b0000001100;
    end
    Jal: begin
        { Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, JAL, JALR } = 10'b100xx0x110;
    end
    Jalr: begin
        { Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, JAL, JALR } = 10'bx000001111;
    end
    default: begin
        { Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, JAL, JALR } = 10'b0000000000;
    end
endcase
end

endmodule
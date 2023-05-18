module alu_control (
 input [1:0] ALUOp,
 input [3:0] func,
 output reg [1:0] alu_control
);



parameter Add = 2'b00;
parameter Sub = 2'b01;
parameter And = 2'b10;
parameter Or  = 2'b11;

parameter Load =   7'b0000011;
parameter Store =  7'b0100011;
parameter Btype = 7'b1100011;
parameter Addi =   7'b0010011;
parameter Jal =    7'b1101111;
parameter Jalr =   7'b1100111;

always @ (ALUOp or func) begin
    case(ALUOp)
        2'b00: begin
            alu_control = 2'b00;
        end
        2'b01: begin
            alu_control = 2'b01;
        end
        2'b10: begin
            case(func)
                4'b0000: alu_control = 2'b00;
                4'b1000: alu_control = 2'b01;
                4'b0111: alu_control = 2'b10;
                4'b0110: alu_control = 2'b11;
            endcase
        end
        default: alu_control = 2'bxx;
    endcase
end

endmodule
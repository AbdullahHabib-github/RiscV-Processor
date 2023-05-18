module immediate_generator (
 input [31:0] instruction_code,
 output reg [31:0] immediate
);



parameter Load =   7'b0000011;
parameter Store =  7'b0100011;
parameter Btype = 7'b1100011;
parameter Addi =   7'b0010011;
parameter Jal =    7'b1101111;
parameter Jalr =   7'b1100111;

always @ (instruction_code) begin
    case(instruction_code[6:0])
        Load: begin
            immediate = {{20{instruction_code[31]}}, instruction_code[31:20]};
        end
        Store: begin
            immediate = {{20{instruction_code[31]}}, instruction_code[31:25], instruction_code[11:7]};
        end
        Btype: begin
            immediate = {{19{instruction_code[31]}}, instruction_code[31], instruction_code[7], instruction_code[30:25], instruction_code[11:8], 1'b0};
        end
        Addi: begin
            immediate = {{20{instruction_code[31]}}, instruction_code[31:20]};
        end
        Jal: begin
            immediate = {{11{instruction_code[31]}} ,instruction_code[31], instruction_code[19:12], instruction_code[20], instruction_code[30:21], 1'b0};
        end
        Jalr: begin
            immediate = {{20{instruction_code[31]}}, instruction_code[31:20]};
        end
        default: immediate = {32{1'b0}};

    endcase
end

endmodule
module alu (
 input [31:0] input_1, 
 input [31:0] input_2,
 input[1:0] alu_control,
 output reg [31:0] alu_result
);

parameter Add = 2'b00;
parameter Sub = 2'b01;
parameter And = 2'b10;
parameter Or  = 2'b11;

always @(*) begin
    case(alu_control)
    Add: alu_result = input_1 + input_2;
    Sub: alu_result = input_1 - input_2;
    And: alu_result = input_1 & input_2;
    Or: alu_result = input_1 | input_2;
endcase

end
endmodule
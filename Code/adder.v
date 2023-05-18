module adder (
 input [31:0] input_1, input_2,
 output reg [31:0] adder_output
);

always @(*) begin
    adder_output = input_1 + input_2;
end
endmodule
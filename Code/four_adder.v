module four_adder (
 input [31:0] input_1,
 output reg [31:0] adder_output
);

always @(*) begin
    adder_output = input_1 + 4;
end
endmodule
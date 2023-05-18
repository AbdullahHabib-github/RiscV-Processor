module mux_32 (
 input [31:0] input_1, input_2,
 input control_line,
 output reg [31:0] output_line
);

always @ (*) begin
    if (control_line == 0)
        output_line = input_1;
    else
        output_line = input_2;
end

endmodule
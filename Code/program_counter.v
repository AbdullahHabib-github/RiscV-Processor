module program_counter(
 input [31:0] next_address,
 input clk,
 input reset,
 output reg [9:0] instruction_address
);

always @(posedge clk) begin
    
    if (reset) // if reset is high, reset the count to 0
    instruction_address <= 10'b0000000000;
    else // else, increment the count
    instruction_address <= next_address;
end

endmodule
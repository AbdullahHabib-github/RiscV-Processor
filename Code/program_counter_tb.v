`include "program_counter.v"

module program_counter_tb;
    
    // Inputs
    reg clk;
    reg reset;
    // Outputs
    wire [9:0] instruction_address;
    // Instantiate the Unit Under Test (UUT)
    program_counter uut (
    .clk(clk),
    .reset(reset),
    .instruction_address(instruction_address)
    );
    initial begin
        $dumpfile("program_counter.vcd");
        $dumpvars(0, program_counter_tb);
        clk = 1'b0; // initialize clock to 0
        reset = 1'b1; // set reset high initially
        #10 reset = 1'b0; // release reset after 10 ticks
        #200 $finish;
    end
    always #5 clk = ~clk; // toggle clock every 5 time units
 endmodule
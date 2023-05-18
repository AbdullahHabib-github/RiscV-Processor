`include "processor.v"


module processor_tb(
);
    reg clk;
    reg reset;

    processor p (
        .clk(clk),
        .reset(reset)
    );


    initial begin
        $dumpfile("processor_tb.vcd");
        $dumpvars(0, processor_tb);
        clk = 1'b0; // initialize clock to 0
        reset = 1'b1; // set reset high initially
        #10 reset = 1'b0; // release reset after 10 ticks
        #200 $finish;
    end
    always #5 clk = ~clk; // toggle clock every 5 time units
 endmodule
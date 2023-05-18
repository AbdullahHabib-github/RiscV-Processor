`include "memory_control.v"
module memory_control_tb;

reg MemRead, MemWrite;
reg [2:0] func3;
wire byte;

memory_control_tb uut (
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .func3(func3),
    .byte(byte)
);

initial begin
    // Test 1: MemRead = 1, func3 = 3'b000
    MemRead = 1;
    MemWrite = 0;
    func3 = 3'b000;
    #10;

    // Test 2: MemWrite = 1, func3 = 3'b000
    MemRead = 0;
    MemWrite = 1;
    func3 = 3'b000;
    #10;

    // Test 3: MemRead = 0, MemWrite = 0, func3 = 3'b001
    MemRead = 0;
    MemWrite = 0;
    func3 = 3'b001;
    #10;

    // Test 4: MemRead = 1, MemWrite = 1, func3 = 3'b111
    MemRead = 1;
    MemWrite = 1;
    func3 = 3'b111;
    #10;

    $finish;
end

endmodule

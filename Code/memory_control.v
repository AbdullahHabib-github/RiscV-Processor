module memory_control (
 input MemRead, MemWrite,
 input [2:0] func3,
 output reg byte
);


always @ (*) begin 
    if(MemRead == 1 & func3 == 3'b000)
        byte = 1;
    else if(MemWrite == 1 & func3 == 3'b000) 
        byte = 1;
    else
        byte = 0;
end


endmodule
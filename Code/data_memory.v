module data_memory(
 input [31:0] address, write_data,
 input MemRead, MemWrite, byte, clk,
 output reg [31:0] read_data 
);

reg [7:0] Memory [1023:0]; 

always @ (*) begin
    if(byte == 0) begin 
        if(MemRead) begin
            read_data = {Memory[address + 3], Memory[address + 2], Memory[address + 1], Memory[address]};
        end
    end
    if(byte == 1) begin
        if(MemRead) begin
            read_data = {{24{Memory[address][7]}},Memory[address]};
        end
    end
end


always @ (posedge clk) begin
    if(byte == 0) begin 
        if(MemWrite) begin
            Memory[address] = write_data[7:0];
            Memory[address + 1] = write_data[15:8];
            Memory[address + 2] = write_data[23:16];
            Memory[address + 3] = write_data[31:24];
        end
    end
    if(byte == 1) begin
        if(MemWrite) begin
            Memory[address] = write_data[7:0];
        end
    end
end

endmodule
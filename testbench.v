module test;
reg [31:0]A,B;
reg clk, rst, dir, enable;
wire [31:0]o1,o2;
bitonic_sorter dut (o1,o2, A, B, clk, rst, dir, enable);
initial
begin
forever #10 clk = ~clk;
end
initial
begin
clk=1'b1;
rst=1'b1;
enable=1'b0;
#10
rst=1'b0;
enable=1'b1;
end
initial
begin
dir=1'b1;
#10
A=3;
B=1;
#30A=2294;
B=133923;
#30A=122;
B=2133;
#30 $stop;
end
endmodule

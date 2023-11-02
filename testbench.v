
module testbench();
  reg [31:0] A, B;
  reg clk, rst, dir, enable;
  wire [31:0] o1, o2;

  
  bitonic_sorter sorter(
    .o1(o1),
    .o2(o2),
    .A(A),
    .B(B),
    .clk(clk),
    .rst(rst),
    .dir(dir),
    .enable(enable)
  );

  
  always begin
    #5 clk = ~clk;
  end

  initial begin
    
    A = 0;
    B = 0;
    clk = 0;
    rst = 1;
    dir = 0;
    enable = 0;

    
    #10 rst = 0;

    // Test Case 1: Sort in ascending order (dir = 0)
    A = 5;
    B = 3;
    dir = 0;
    enable = 1;
    #10;
    // Verify the output o1 and o2

    // Test Case 2: Sort in descending order (dir = 1)
    A = 8;
    B = 12;
    dir = 1;
    enable = 1;
    #10;
    // Verify the output o1 and o2

    // Test Case 3: A and B are equal
    A = 10;
    B = 10;
    dir = 0;
    enable = 1;
    #10;
    // Verify the output o1 and o2

    // Test Case 4: A and B are equal with descending sort
    A = 7;
    B = 7;
    dir = 1;
    enable = 1;
    #10;
    // Verify the output o1 and o2

    // Test Case 5: Sort in ascending order with enable=0
    A = 15;
    B = 20;
    dir = 0;
    enable = 0;
    #10;
    // Verify the output o1 and o2

    // Test Case 6: Sort in descending order with reset
    A = 3;
    B = 1;
    dir = 1;
    enable = 1;
    #10;
    // Verify the output o1 and o2
    rst = 1;
    #10;
    rst = 0;
    #10;

    // Test Case 7: A greater than B, ascending sort
    A = 25;
    B = 20;
    dir = 0;
    enable = 1;
    #10;
    // Verify the output o1 and o2

    // Test Case 8: B greater than A, descending sort
    A = 18;
    B = 30;
    dir = 1;
    enable = 1;
    #10;
    // Verify the output o1 and o2

    // Test Case 9: Random values for A and B with enable=1
    A = 17;
    B = 28;
    dir = 0;
    enable = 1;
    #10;
    // Verify the output o1 and o2

    // Test Case 10: Reset with enable=0
    A = 10;
    B = 15;
    dir = 0;
    enable = 0;
    rst = 1;
    #10;
    rst = 0;
    #10;
//Test Case 11: A greater than B, descending sort
A = 40;
B = 35;
dir = 1;
enable = 1;
#10;
// Verify the output o1 and o2

// Test Case 12: B greater than A, ascending sort
A = 100;
B = 150;
dir = 0;
enable = 1;
#10;
// Verify the output o1 and o2

// Test Case 13: Random values with enable=0
A = 72;
B = 49;
dir = 0;
enable = 0;
#10;
// Verify the output o1 and o2

// Test Case 14: Random values with enable=1, then reset
A = 31;
B = 55;
dir = 1;
enable = 1;
#10;
// Verify the output o1 and o2
rst = 1;
#10;
rst = 0;
#10;

// Test Case 15: Alternate between ascending and descending sorts
A = 30;
B = 40;
dir = 0;
enable = 1;
#10;
// Verify the output o1 and o2
dir = 1;
#10;
// Verify the output o1 and o2
// Test Case 16: Sort with very large values
A = 2147483647; // Max positive 32-bit integer
B = -2147483648; // Min negative 32-bit integer
dir = 0;
enable = 1;
#10;
// Verify the output o1 and o2

// Test Case 17: Alternating between enable and disable
A = 42;
B = 18;
dir = 0;
enable = 1;
#10;
// Verify the output o1 and o2
enable = 0;
#10;
enable = 1;
#10;
// Verify the output o1 and o2

// Test Case 18: Large values with descending sort
A = 1000000;
B = 999999;
dir = 1;
enable = 1;
#10;
// Verify the output o1 and o2

// Test Case 19: A and B are swapped in descending sort
A = 60;
B = 75;
dir = 1;
enable = 1;
#10;
// Verify the output o1 and o2

// Test Case 20: Large negative values with enable=0
A = -2147483647; // Max negative 32-bit integer
B = -1000000;
dir = 0;
enable = 0;
#10;
    $finish;
  end
endmodule

module bitonic_sorter(output wire [31:0] o1, o2, input wire [31:0] A, B, input wire clk, rst, dir, enable);
  reg sel;
  reg [31:0] out1, out2;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      out1 <= 32'b0;
      out2 <= 32'b0;
    end
    else if (enable) begin
      if (dir == 1'b0) begin
        sel <= (A > B);
        out1 <= (sel) ? B : A;
        out2 <= (sel) ? A : B;
      end
      if (dir == 1'b1) begin
        sel <= (A < B);
        out1 <= (sel) ? B : A;
        out2 <= (sel) ? A : B;
      end
    end
  end

  assign o1 = out1;
  assign o2 = out2;
endmodule


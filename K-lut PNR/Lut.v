module Lut (
    input [4:0] a,
    input [4:0] b,
    input clk,
    input reset,
    input [1:0] s,
    input sync,
    output reg [4:0] out
);

reg [4:0] y;

always @(*) begin
    y = 5'b0;
    case (s)
        2'b00: y = a & b;
        2'b01: y = a | b;
        2'b10: y = a + b;
        2'b11: y = a - b;
        default: y = 5'b0;
    endcase
end
reg [4:0] out_reg;

always @(posedge clk or posedge reset) begin
    if (reset)
        out_reg <= 5'b0;
    else
        out_reg <= y;
end

always @(*) begin
    if (sync)
        out = out_reg;
    else 
        out = y;
end

endmodule
module B220581CS_VANKAYALAPATI_1_tb;

reg clk,reset,data;
wire result;



B220581CS_VANKAYALAPATI_1 st(clk,reset,data,result);
integer i;
 reg [15:0]totaldata=16'b0110_1001_0101_1010;
 always #5 clk= ~clk;

initial
begin
clk=0;
reset=0;
data=0;
i=0;
#5 reset =1;



for(i=0;i<16;i=i+1)
begin
data=totaldata[i];
#10;
end
end

endmodule



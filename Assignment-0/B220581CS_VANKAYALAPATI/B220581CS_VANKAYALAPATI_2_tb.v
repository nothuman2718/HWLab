module Q2_tb;

reg [7:0]a,b;
reg bin;

wire [7:0]result;
wire bout;

Q2 aa(a,b,bin,result,bout);

integer i;

initial
begin

for(i=0;i<65536;i=i+1)
begin
{a,b}=i;
bin=1'b0;
#10;
end
end
endmodule





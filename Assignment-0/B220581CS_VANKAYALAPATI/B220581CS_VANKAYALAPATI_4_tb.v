module Q4_tb;

reg [7:0]d;
reg enable,reset;

wire [7:0]q;

Q4 aa(d,reset,enable,q);

integer i;

initial
begin
for(i=0;i<1024;i=i+1)
begin
{d,enable,reset}=i;
#10;
end
end
endmodule


 

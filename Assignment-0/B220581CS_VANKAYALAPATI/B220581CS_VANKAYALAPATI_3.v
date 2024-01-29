module Q3
	(input [7:0]a ,b,
	input [1:0]s,
	 output reg [7:0]result,
	 output reg cout);
	 
always@(*)
begin

if(s==2'b00)
{cout,result}=a+b;
else if(s==2'b01)
{cout,result}=a-b;
else if(s==2'b10)
begin
cout=1'bx;
result=a^b;
end
else
begin
cout=1'bx;
result=a<<1;
end
end

endmodule

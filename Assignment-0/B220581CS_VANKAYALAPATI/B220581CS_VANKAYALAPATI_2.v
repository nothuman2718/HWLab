module Q2(input [7:0]a,b,
			 input bin,
			  output reg [7:0]result,
			  output reg bout);

integer i;
reg borrow;

always@(a or b or bin)
begin

result[0]=a[0]^b[0]^bin;
borrow =(~a[0] & b[0]) | (~a[0] & bin) | (bin & b[0]);
for(i=0;i<8;i=i+1)
begin
result[i]=a[i]^b[i]^borrow;
borrow =(~a[i] & b[i]) | (~a[i] & borrow) | (borrow & b[0]);
end
bout=borrow;

end

endmodule


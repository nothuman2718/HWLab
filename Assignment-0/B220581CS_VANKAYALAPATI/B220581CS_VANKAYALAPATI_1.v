module Assignment
						(input [7:0]a ,b,
						input cin,
						output reg [7:0]result,
							output reg cout);

integer i;
reg carry;
always@(a or b or cin)
begin

result[0]=a[0]^b[0]^cin;
carry=a[0]&b[0] | b[0]&cin | cin&a[0];

for(i=1;i<8;i=i+1)

begin
result[i]=a[i]^b[i]^carry;
carry=a[i]&b[i] | b[i]&carry| carry&a[i];
end
cout=carry;

end
endmodule


						

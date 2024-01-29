module Assignment_tb;

reg [7:0]a,b;
reg cin;

wire [7:0]result;
wire cout;

Assignment aa(a,b,cin,result,cout);

integer i;

initial
begin

for(i=0;i<65336;i=i+1)
begin
{a,b}=i;
cin=1'b0;
#10;
end
end

endmodule


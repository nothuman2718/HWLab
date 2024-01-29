module Q3_tb;

reg [7:0]a,b;
reg [1:0]s;
wire [7:0]result;
wire cout;

Q3 aa(a,b,s,result,cout);

integer i;

initial

begin

for(i=0;i<200;i=i+1)

begin

a=$random;
b=$random;
s=$random;
#10;
end
end
endmodule




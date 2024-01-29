module Q4(input [7:0]d,
			input reset,enable,
			output reg [7:0]q);
			
always@(*)
begin
if(!reset) q<=8'b00000000;
else 
begin
if(enable) q<=d;
end
end
endmodule


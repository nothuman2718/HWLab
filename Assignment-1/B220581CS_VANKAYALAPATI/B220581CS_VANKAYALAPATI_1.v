 module B220581CS_VANKAYALAPATI_1(
				input clk,reset,data,
				output reg result
				);
				
parameter ZERO=2'b00;
parameter det_1=2'b01;
parameter det_10=2'b10;

reg [1:0]state=ZERO;

always@(posedge clk)
begin

	if(~reset)
	begin
		state<=ZERO;
		result=1'b0;
	end
	else
		begin
			case(state)
				ZERO: 
					begin
						if(data) state<=det_1;
						result=1'b0;
					end
				det_1:
					begin
						if(~data) state<=det_10;
						result=1'b0;
					end
				det_10:
				begin
				if(data) 
					begin
						state<=det_1;
						result=1'b1;
					end
				else
					begin
						state<=ZERO;
						result=1'b0;
					end
				end
			endcase
		end
end
endmodule

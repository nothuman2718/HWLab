module B220581CS_VANKAYALAPATI_2(
						input clk,output reg NS,EW);

parameter NSs=2'b00;
parameter EWs=2'b01;

reg state=NSs;
integer count=0;
always@(posedge clk)
begin
case(state)
NSs:
	begin
		if(count<2)
			begin 
				state<=NSs;
				NS=1;
				EW=0;
				count=count+1;
			end
		else
			begin
				state<=EWs;
				NS=1;
				EW=0;
				count=0;
			end
	end
EWs:
	begin
		if(count<2)
			begin
				state<=EWs;
				NS=0;
				EW=1;
				count=count+1;
			end
		else
			begin
				state<=NSs;
				NS=0;
				EW=1;
				count=0;
			end
	end
endcase
end
endmodule

		

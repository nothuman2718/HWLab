module B220581CS_VANKAYALAPATI_3
					(input clk,reset,codesw,anysw,
					 output reg [1:0]selsw,
					 output reg locked,alarm,entimer );
					 
parameter s0=3'b000,
			 s1=3'b001,
			 s2=3'b010,
			 s3=3'b011,
			 wrong=3'b100,
			 unlock=3'b101;
reg [2:0]state=s0;
integer count=0;

always@(posedge clk)
begin
	if(reset==1)
		begin
			state<=s0;
			selsw<=0;
			locked<=1;
			entimer<=0;
			alarm<=1;
		end
	else if(anysw==0)
		begin
			state<=s0;
			selsw<=1'bx;
			locked<=1'bx;
			entimer<=1'bx;
			alarm<=1'bx;
		end
	else
	begin
		case(state)
		s0:
			begin
				if(codesw==1 && anysw==1)
					begin
						state<=s1;
						selsw<=2'b01;
						locked<=1;
						entimer<=0;
						alarm<=1;
					end
				else if(codesw==0 && anysw==1)
					begin
						state<=wrong;
						selsw<=0;
						locked=1;
						entimer<=0;
						alarm<=0;
					end
			end
		s1:
			begin
				if(codesw==1 && anysw==1)
					begin
						state<=s2;
						selsw<=2'b10;
						locked<=1;
						entimer<=0;
						alarm<=1;
					end
				else if(codesw==0 && anysw==1)
					begin
						state<=wrong;
						selsw<=0;
						locked=1;
						entimer<=0;
						alarm<=0;
					end
			end
		s2:
			begin
				if(codesw==1 && anysw==1)
					begin
						state<=s3;
						selsw<=2'b11;
						locked<=1;
						entimer<=0;
						alarm<=1;
					end
				else if(codesw==0 && anysw==1)
					begin
						state<=wrong;
						selsw<=0;
						locked=1;
						entimer<=0;
						alarm<=0;
					end
			end
		s3:
			begin
				if(codesw==1 && anysw==1)
					begin
						state<=unlock;
						selsw<=0;
						locked<=0;
						entimer<=1;
						alarm<=1;
					end
				else if(codesw==0 && anysw==1)
					begin
						state<=wrong;
						selsw<=0;
						locked=1;
						entimer<=0;
						alarm<=0;
					end
			end
		unlock:
			begin
				count=count+1;
				locked<=0;
				selsw<=0;
				entimer<=1;
				alarm<=1;
				if(count==10)
					begin
						state<=s0;
						alarm<=1;
						locked<=1;
						selsw<=0;
						count=0;
						entimer<=0;
					end
			end
		wrong:
			begin
				locked<=1;
				alarm<=0;
				entimer<=0;
				selsw<=0;
			end
	endcase
	end
end

endmodule		
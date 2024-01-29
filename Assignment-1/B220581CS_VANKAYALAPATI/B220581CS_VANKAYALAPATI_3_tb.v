module B220581CS_VANKAYALAPATI_3_tb;

reg clk,reset,codesw,anysw;
wire locked,alarm,entimeter;
wire [1:0]selsw;
integer i,j;

B220581CS_VANKAYALAPATI_3 bla(clk,reset,codesw,anysw,selsw,locked,alarm,entimer);
initial
	begin
		clk=0;
		for(i=0;i<100;i=i+1)
			begin
				clk=~clk;
				#5;
			end
	end
initial
	begin
		for(j=0;j<50;j=j+1)
			begin
				reset=0;
				codesw=1;
				anysw=1;
				#10;
			end
	end
endmodule

	
		
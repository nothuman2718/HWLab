module B220581CS_VANKAYALAPATI_2_tb;

reg clk;
wire NS,EW;

B220581CS_VANKAYALAPATI_2 ss(clk,NS,EW);

always #2 clk=~clk;

initial
begin
clk=0;
end

endmodule

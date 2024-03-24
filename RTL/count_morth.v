module count_morth
( 
  clk
 ,rst_n
 ,count_morth
 ,set_morth
 ,morth
);
  input            clk        ;
  input            rst_n      ;
	input            count_morth;
	input            set_morth  ;
  output reg [3:0] morth      ;


	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			morth <= 4'd0;
	  end
		else if(count_morth || set_morth) begin
			morth <= morth + 4'd1;
		end
		else begin
			morth <= morth ;
	  end
	end
endmodule

module day_of_morth
 (
 		num_morth
	 ,num_year
	 ,max_day_of_morth
);

   input      [15:0] num_year        ;
   input      [3 :0] num_morth       ;
   output reg [4 :0] max_day_of_morth;

  parameter JANUARY   = 31;  
  parameter FEBRUARY  = 29;  
  parameter MARCH     = 31;  
  parameter APRIL     = 30;  
  parameter MAY       = 31;  
  parameter JUNE      = 30;  
  parameter JULY      = 31;  
  parameter AUGUST    = 31;  
  parameter SEPTEMBER = 30;  
  parameter OCTOBER   = 31;  
  parameter NOVEMBER  = 30;  
  parameter DECEMBER  = 31;  


 always @(*) begin
 		case(num_morth)
			 4'd1  : max_day_of_morth = JANUARY   ;
			 4'd3  : max_day_of_morth = MARCH     ;
			 4'd4  : max_day_of_morth = APRIL     ;
			 4'd5  : max_day_of_morth = MAY       ;
			 4'd6  : max_day_of_morth = JUNE      ;
			 4'd7  : max_day_of_morth = JULY      ;
			 4'd8  : max_day_of_morth = AUGUST    ;
			 4'd9  : max_day_of_morth =  SEPTEMBER;
			 4'd10 : max_day_of_morth = OCTOBER   ;
			 4'd11 : max_day_of_morth = DECEMBER  ;
			 4'd12 : max_day_of_morth = NOVEMBER  ;
			 4'd2  : max_day_of_morth = (num_year % 4) ? (FEBRUARY) : (FEBRUARY + 5'd1) ;
			 default max_day_of_morth = JANUARY   ;
		endcase
	end
endmodule


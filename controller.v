module controller( 
   clk
  ,rst_n
  ,num_sec
  ,num_min
  ,num_hour
  ,num_morth
  ,num_day
  ,num_year
  ,count_sec
  ,count_min
  ,count_hour
  ,count_day
  ,count_morth 
  ,count_year
);
  input       clk       ;
  input       rst_n     ;
  input [7:0] num_sec   ;
  input [6:0] num_min   ;
  input [4:0] num_hour  ;
  input [3:0] num_morth ;
  input [8:0] num_day   ;
  input [15:0] num_year ;
  output reg count_sec  ;
  output reg count_min  ;
  output reg count_hour ;
  output reg count_day  ;
  output reg count_morth; 
  output reg count_year ;
  
  parameter COUNTING    = 3'b000 ;
  parameter COUNT_MIN   = 3'b001 ;
  parameter COUNT_HOUR  = 3'b010 ;
  parameter COUNT_DAY   = 3'b011 ;
  parameter COUNT_MORTH = 3'b100 ;
  parameter COUNT_YEAR  = 3'b101 ;
  
  reg [2:0] current_state;
  reg [2:0] next_state   ;
  
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      current_state <= COUNTING;
    end
    else begin
      current_state <= next_state;
    end
  end
    
    always @(*) begin
      case(current_state)
        COUNTING: begin
          if(num_sec == 8'd59)begin
            next_state = COUNT_MIN;
          end
          else begin
            next_state = COUNTING;
          end
        end
        COUNT_MIN: begin 
          if(num_min == 59 && num_sec == 59) begin
            next_state = COUNT_HOUR;
          end
          else begin
            next_state = COUNTING;
          end
        end
        COUNT_HOUR:begin
          if(num_hour == 23 && num_min == 59 && num_sec == 59) begin
            next_state = COUNT_DAY;
          end
          else begin
             next_state = COUNTING;
          end
        end
        COUNT_DAY: begin
          if(num_day == 365 & num_hour == 23 && num_min==59 && num_sec == 59) begin
            next_state = COUNT_YEAR;
          end
          else begin
            next_state = COUNTING;
          end
        end
        COUNT_MORTH: begin
          if(num_morth == 11 && num_hour == 23 && num_min==59 && num_sec == 59) begin
            next_state = COUNT_YEAR;
          end
          else begin
            next_state = COUNTING;
          end
        end
        default: next_state = COUNTING;
      endcase
    end
    
    always @(*) begin
      count_min   = 1'b0;
      count_hour  = 1'b0;
      count_day   = 1'b0;
      count_morth = 1'b0;
      count_year  = 1'b0;
      case(current_state) 
        COUNTING    : begin /* */ end
        COUNT_MIN   : count_min   = 1'b1;
        COUNT_HOUR  : count_hour  = 1'b1;
        COUNT_DAY   : count_day   = 1'b1;
        COUNT_MORTH : count_morth = 1'b1;
        COUNT_YEAR  : count_year  = 1'b1;
        default     : begin /* */ end
      endcase
    end
    endmodule

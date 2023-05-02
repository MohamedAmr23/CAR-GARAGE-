/*module counter(clk,count,reset);
  input clk,reset;
  output reg[2:0] count=0;
  always @(posedge clk or posedge reset)
  if(reset)
    count<=0;
  else
  count <=count+1;
endmodule

module counter_g();
  wire clk;
  reg reset;
 wire[2:0] count;
 initial
 begin
 reset=1;  #50
 reset=0;
 end
 counter g(clk,count,reset);
 endmodule*/
/* module counter(clk,reset,D);
   input clk,reset;
   output[49:0]D;
   parameter s0=2? b00,
            s1=2? b01,
            s2=2? b10,
            s3=2? b11;
            reg[1:0] state;
            always @(posedge clk or posedge reset)
            begin
              if(reset)
                begin
                  state=s0;
                  D<=10? 0000_0000_01;
                end
              else
                begin
                  case(state)
                    s0:state<=s1;
                    s1:if(D<1000_0000_00)
                    D<=D<<1;
                  else
                    state<=s2;
                    s2:if(D<10b0000_0000_01)
                    D<=D>>1;
                  else
                    state<=s1;
                  endcase
                end
            end*/
            module car_garag(clk,reset,park_in,park_out,door,count,state); 
input clk; //clock signal
 input reset; //reset signal
 input park_in; //input signal for car entering the garage
 input park_out; //input signal for car leaving the garage
 output reg door=0; //output signal to open the garage door
 output reg [5:0] count =0 ; //number of cars in the garage (max 50)
 output reg[1:0] state;
  parameter s0=2'b00,//
             s1=2'b01,
             s2=2'b10,
             s3=2'b11;
 always @(posedge clk or posedge reset)
  begin//end1
    if(reset) //reset counter and output signal when reset is high
    begin 
        state=s0;
        count <= 0;
        
      door <= 0;  
    end 
    else //end2
      begin
        if(park_in)
          begin
           if(count == 6'b110010) 
          begin //don't open garage and print "full" when count is equal to 50
          state=s2;
            door <= 0;
            $display("full");
              
          end
      else
        begin
         state=s1;
            count<= count +1;
            door <=1;     
        end 
         
      end
        else// end3
          begin
        if(park_out ) 
        begin
          if(count == 6'b000000)
         begin //print "empty" when there are no cars in the garage
         state=s0;
            $display("empty");
            
          end
        else
        begin //decrement counter when car leaves and count is greater than 0
        state=s3;
           count<= count -1;
             door <= 1;
     
          end
          
        end
      else //end4
          begin //keep output signal and counter values unchanged otherwise 
        door <= door;
            count<= count ;
          
        end
      end
    end
  end
 
  endmodule 
  //////////////////////////////////////////////////////////////////////////////////////
Module2
module car_dut();
  wire clk;
  reg reset;
  reg park_in=0;
  reg park_out=0;
  wire door;
  wire[5:0] count;
   wire[1:0] state;
  
  
initial
begin
   reset=1;#50;
  reset=0;
   park_in=1 ; park_out=0;#3000;  
  park_in=0; park_out=1;#3000;
end
car_garag car(clk,reset,park_in,park_out,door,count,state);
endmodule
//////////////////////////////////////////////////////////////////////////////////////
Module3
module show(clk,count,leds1,leds2);
  input clk;
   input  [5:0] count;
  output[6:0] leds1;
  output[6:0] leds2;
  wire[3:0]digit1=count%10;
  wire[3:0]digit2=count/10;
  Segment seg(digit1[3],digit1[2],digit1[1],digit1[0],leds1[6],leds1[5],leds1[4],leds1[3],leds1[2],leds1[1],leds1[0]);
  Segment seg2(digit2[3],digit2[2],digit2[1],digit2[0],leds2[6],leds2[5],leds2[4],leds2[3],leds2[2],leds2[1],leds2[0]);
  
endmodule

module Segment(A, B, C, D, led_a, led_b, led_c, led_d,
led_e, led_f, led_g);

input A, B, C, D;
output led_a, led_b, led_c, led_d, led_e, led_f, led_g;

assign led_a = ~(A | C | B&D | ~B&~D);
assign led_b = ~(~B | ~C&~D | C&D);
assign led_c = ~(B | ~C | D);
assign led_d = ~(~B&~D | C&~D | B&~C&D | ~B&C | A);
assign led_e = ~(~B&~D | C&~D);
assign led_f = ~(A | ~C&~D | B&~C | B&~D);
assign led_g = ~(A | B&~C | ~B&C | C&~D);

endmodule
//////////////////////////////////////////////////////////////////////////////////////
Module4
module car_system(clk,reset,park_in,park_out,count,leds1,leds2);
  input reset;
  input clk;
  input park_in;
   input park_out;
output [6:0] leds1;
  output[6:0] leds2;
  wire door;
   //wire [5:0] num ;
   output [5:0] count;
  wire [1:0] state;
   car_garag Car(clk,reset,park_in,park_out,door,count,state);
   //count=num;
   show dis(clk,count,leds1,leds2);
   
 endmodule
 module CarSystem_dut();
  wire clk;
  reg reset;
  reg park_in=0;
  reg park_out=0;
  wire [6:0] leds1;
  wire [6:0] leds2;
  wire [5:0] count;
  
  
initial
begin
   reset=1;#50;
  reset=0;
   park_in=1 ; park_out=0;#2000;  
  park_in=0; park_out=1;#2000;
end
car_system car(clk,reset,park_in,park_out,count,leds1,leds2);
initial
begin
$monitor("%b",count);
end
endmodule
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
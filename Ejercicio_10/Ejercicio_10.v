//Descripción de comportamiento del multiplexor 4 a 1
module Ejercicio_10(SW0, SW1, SW2, SW3, SW4, LED0);

input SW0, SW1, SW2, SW3;
input [1:0] SW4;
output reg LED0;

always @ (SW0 or SW1 or SW2 or SW3 or SW4)
case (SW4)
2'b00 : LED0 = SW0;
2'b01 : LED0 = SW1;
2'b10 : LED0 = SW2;
2'b11 : LED0 = SW3;
endcase

endmodule

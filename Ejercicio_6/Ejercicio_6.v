module Ejercicio_6(SWA, SWB, SW8, LED_SUM, LED4);

input [3:0] SWA, SWB;
input SW8;
output [3:0] LED_SUM;
output LED4;

assign {LED4, LED_SUM} = SWA + SWB + SW8;

endmodule

//Descripción de flujo de datos de un comparador de 4 bits
module Ejercicio_7(SWA, SWB, LED0, LED1, LED2);

input [3:0] SWA, SWB;
output LED0, LED1, LED2;

assign LED0 = (SWA < SWB),
LED1 = (SWA > SWB),
LED2 = (SWA == SWB);

endmodule

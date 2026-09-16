//Descripción de flujo de datos del multiplexor 2 a 1 utilizando el operador if-else
module Ejercicio_9(SW0, SW1, SW2, LED0);
input SW0, SW1, SW2;
output LED0;
reg LED0;

always @ (SW2 or SW0 or SW1)
if (SW2 == 1)
LED0 = SW0;
else
LED0 = SW1;

endmodule

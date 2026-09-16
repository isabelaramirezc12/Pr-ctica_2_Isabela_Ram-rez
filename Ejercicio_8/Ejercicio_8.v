//Descripción de flujo de datos del multiplexor 2 a 1 utilizando el operador condicional
module Ejercicio_8(SW0, SW1, SW2, LED0);
input SW0, SW1, SW2;
output LED0;

assign LED0 = SW2 ? SW0 : SW1;

endmodule


//Descripción de flujo de datos de un decodificador de 2 a 4
module Ejercicio_5(SW0,SW1,SW2,LED0,LED1,LED2,LED3);

input SW0,SW1,SW2;
output LED0,LED1,LED2,LED3;

assign LED0 = ~((~SW0) & (~SW1) & (~SW2)),
LED1 = ~((~SW0) & (SW1) & (~SW2)),
LED2 = ~((SW0) & (~SW1) & (~SW2)),
LED3 = ~((SW0) & (SW1) & (~SW2));

endmodule
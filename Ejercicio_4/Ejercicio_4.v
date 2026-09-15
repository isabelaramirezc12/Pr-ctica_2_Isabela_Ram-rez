//Descripción de un multiplexor 2 a 1 usando buffer de 3 estados
module Ejercicio_4(SW0, SW1, SW2, LED0);
input SW0, SW1, SW2;
output LED0;
tri LED0;
bufif1 (LED0, SW0, SW2);
bufif0 (LED0, SW1, SW2);
endmodule

//Descripción jerárquica ascendente, a nivel de compuertas, de un sumador de 4 bits

module half_adder(LED0, LED1, SW0, SW1); //Semi-sumador (Módulo Inferior)

input SW0, SW1;
output LED0, LED1;

//Crear ejemplares de compuertas primitivas
xor (LED0, SW0, SW1);
and (LED1, SW0, SW1);

endmodule


module full_adder(LED2, LED3, SW2, SW3, SW4); //Sumador completo (Módulo Intermedio)

input SW2, SW3, SW4;
output LED2, LED3;

wire SW5, SW6, SW7; //Salidas de XOR y dos AND

//Crear dos ejemplares del semisumador de 2 bits
half_adder HA1 (SW5, SW6, SW2, SW3),
           HA2 (LED2, SW7, SW5, SW4);

or (LED3, SW7, SW6);

endmodule


module Ejercicio_3(
    LED0, LED1, LED2, LED3, LED4,
    SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8
); //Sumador de 4 bits (Macro Módulo)


input SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7;
input SW8;

output LED0, LED1, LED2, LED3, LED4;

wire SW9, SW10, SW11; //Acarreos intermedios

//Crear cuatro ejemplares del sumador completo de 2 bits

full_adder FA0 (LED0, SW9, SW0, SW4, SW8),
           FA1 (LED1, SW10, SW1, SW5, SW9),
           FA2 (LED2, SW11, SW2, SW6, SW10),
           FA3 (LED3, LED4, SW3, SW7, SW11);

endmodule

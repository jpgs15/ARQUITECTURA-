## Integrantes
-Juan Pablo Gomez Socha 90166                                       
-Daniel Franco 

## Sumador 1 BIT 
el siguiente codigo representa un sumador de 1 bit
#### difinicion del modulo 
module sum1b(              
        -input A,      
        -input B,     
        -input Ci,   
        -output Cout,  
        -output Sum    
    );

El módulo se llama sum1b.
Tiene 3 entradas: A, B, y Ci. Estas representan los dos bits que quieres sumar (A y B) y el acarreo de entrada (Ci).
#### Registro para almacenar el resultado
reg [1:0] result;     
Se declara una variable de 2 bits llamada result, que almacenará el resultado de la suma. Se usa 2 bits porque al sumar tres bits (A + B + Ci), el resultado puede ocupar hasta 2 bits.

#### Asignación de salidas
assign Sum = result[0];   
assign Cout = result[1];

Sum (la suma) se asigna al bit menos significativo de result, que es result[0].               
Cout (el acarreo de salida) se asigna al bit más significativo de result, que es result[1].

#### Bloque combinacional

always@(*)                              
begin   
result = A+B+Ci;   
    end   
 Este bloque es un bloque combinacional. El código dentro de always@ se ejecuta siempre que cambie alguna de las entradas (A, B, Ci) Dentro del bloque, la suma de A, B y Ci se asigna a result. Como el tamaño de result es de 2 bits, el bit menos significativo de esta suma será la salida Sum, y el bit más significativo será la salida Cout. 

 #### Tabla de verdad sumador de 1 bit    
<p align="center">
 <img src="../IMAGENES/tabdever.png" alt="tabla de dervdad" width=300 >
</p>
A partir de la tabla de verdad vamos a comprobar por medio de la simulación se fueron verificando tanto las entradas y salidas y así comprobar que lo que se representó en la tabla de verdad en la simulación también funcionara de la misma manera luego se realizo la carga a la FPGA 
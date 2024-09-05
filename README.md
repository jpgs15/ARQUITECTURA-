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
A partir de la tabla de verdad vamos a comprobar por medio de la simulación se fueron verificando tanto las entradas y salidas y así comprobar que lo que se representó en la tabla de verdad en la simulación también funcionara de la misma manera luego se realizo la carga a la FPGA.
<p align="center">
 <img src="../IMAGENES/simu.png" alt="Simulacion" width=300 >
</p>

## Sumador 4 BITS 
 El sumador está compuesto de cuatro módulos más pequeños, llamados sum1b, que implementan un sumador completo de 1 bit (también conocido como full adder). El objetivo de este sumador de 4 bits es sumar dos números binarios de 4 bits (A y B), generando una salida de 4 bits (Sum) y un acarreo de salida (Cout).
 #### Definición del módulo
 module sum4b (   
        input  [3:0] A,    
        input  [3:0] B,   
        output Cout,      
        output [3:0] Sum    
    );   
El módulo sum4b tiene dos entradas de 4 bits (A y B), una salida de acarreo (Cout), y una salida de suma de 4 bits (Sum).
A y B son los dos números de 4 bits que se van a sumar.
Sum es el resultado de la suma.
Cout es el acarreo de salida que se produce si la suma de los 4 bits genera un acarreo adicional.
#### Declaración de cables para los acarreo internos:
  wire c1,c2,c3;  
  wire c_out; 

Los cables (wire) almacenan los acarreos intermedios generados por cada sumador de 1 bit. El acarreo de un sumador se pasa como entrada al siguiente.
c1, c2 y c3 se utilizan para conectar los acarreos entre los sumadores.
#### Instanciación de los sumadores de 1 bit


  -sum1b s0 (.A(A[0]), .B(B[0]), .Ci(1'b0),  .Cout(c1) ,.Sum(Sum[0]));   
  -sum1b s1 (.A(A[1]), .B(B[1]), .Ci(c1), .Cout(c2) ,.Sum(Sum[1]));  
  -sum1b s2 (.A(A[2]), .B(B[2]), .Ci(c2), .Cout(c3) ,.Sum(Sum[2]));  
  -sum1b s3 (.A(A[3]), .B(B[3]), .Ci(c3), .Cout(Cout) ,.Sum(Sum[3]));     

El sumador de 4 bits se construye utilizando cuatro instancias del módulo sum1b, que implementa un sumador completo de 1 bit.           

Este diseño implementa un sumador en cadena. La suma comienza en el bit menos significativo (A[0] y B[0]), y el acarreo resultante de esta suma (c1) se pasa al siguiente bit (A[1] y B[1]). Esto se repite para todos los bits, hasta llegar al bit más significativo (A[3] y B[3]), donde el acarreo de salida final (Cout) es generado.


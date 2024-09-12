`include "sum4b.v"
module restador(
    input [3:0] a,       // entrada 1 de 4 bits
    input [3:0] b,       // entrada 2 de 4 bits
    input sel,           // selector
    output Cout,    //  acarreo salida de cada bit.
    output [3:0] Rest  // resta salida
);
    // Señal interna para el acarreo de salida de cada bit
     wire C1;
     wire b0,b1,b2,b3;
     wire C_out;
    
     assign b0 = b[0]^sel;
     assign b1 = b[1]^sel;
     assign b2 = b[2]^sel;
     assign b3 = b[3]^sel;

     sum4b s0 (.a(a), .b({b3,b2,b1,b0}), .ci(sel), .Cout(Cout) ,)

     case (status)
     NEG:
     default:
     
     endcase

endmodule
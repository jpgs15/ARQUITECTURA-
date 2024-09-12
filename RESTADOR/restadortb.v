`include "restador.v"
`timescale 1ns/1ns
module restadortb;

    // Declarar señales para conectar con el módulo 
    reg [3:0] a_tb;
    reg [3:0] b_tb;
    wire [3:0] diff_tb;
    wire carri_out_tb;

    // Instanciamiento del módulo 
    restador uut (
        .a(a_tb),
        .b(b_tb),
        .diff(diff_tb),
        .carri_out(carri_out_tb)
    );

    initial begin
        // Inicializar señales
        a_tb = 0;
        b_tb = 0;

    // B_tb varía de 0 a 14
    for ( b_tb < 15; b_tb = b_tb + 1) begin
        // Incrementar A_tb cada vez que B_tb llegue a 0
        if (b_tb == 0) begin
            a_tb = a_tb + 1;
        end
        

        //  resultado de la resta
          #5;$display("a = %d, b = %d, a - b = %d", a_tb, b_tb, diff_tb);
    end
          $finish;
    end

      initial begin: TEST_CASE
		$dumpfile("restadortb.vcd");
		$dumpvars(-1, uut);
	end
  

endmodule
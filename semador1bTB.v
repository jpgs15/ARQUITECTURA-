`timescale 1ns/1ns
`include "sumador1bit.v"
module sumador1bTB();

    reg a_TB;
    reg b_TB;
    reg ci_TB;
    sumador1bit uut(
        .a(a_TB),
        .b(b_TB),
        .ci(ci_TB)
    );
initial begin
    a_TB=0;
    b_TB=1;
    ci_TB=0;
end
initial begin:test_case
    $dumpfile("sumador1bTB.vcd");
    $dumpvars(-1,uut);
    #200 $finish;
end

endmodule
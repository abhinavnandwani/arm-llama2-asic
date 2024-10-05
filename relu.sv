module relu(in, out);

    input [15:0] in;
    output [15:0] out;

    assign out = (in>0) ? in:0;
endmodule
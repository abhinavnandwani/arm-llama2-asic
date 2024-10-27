

module systolic_control();

    /** 
    Matrix A is injected from left edge (west side) of array one element per row per clk cycle
    Matrix B is injected from top edge (north side) of array one element per col per clk cycle 
    elements of A move horizontally and of B move vertically through the array elements are injected in a 
    stagerred manner, each subsequent row and col has a 1 clk delay to its predecessor because elements 
    have to move in a systolic manner first  
    **/

    // Generate staggered FIFO injections for Matrix A (rows)
    genvar i;
    generate
        for (i = 0; i < 32; i++) begin : A_fifos
            fifo_inject #(
                .ZERO_DELAY(i)                 // Stagger delay for each row of A
            ) A_fifo (
                .clk(clk),
                .rst_n(rst_n),
                .load(load),
                .read_en(read_en),
                .data_in(A_in),                // Parallel load for row data
                .data_out(A_out[i])            // Individual output for each row
            );
        end
    endgenerate

    

endmodule



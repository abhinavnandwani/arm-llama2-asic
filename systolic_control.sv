module systolic_control(
    input logic clk,
    input logic rst_n,
    input logic load,                    // Load signal for initializing FIFOs
    input logic read_en,                 // Read enable signal for FIFOs
    input [15:0] A_in[0:31],             // Parallel load input for matrix A
    input [15:0] B_in[0:31],             // Parallel load input for matrix B
    output logic [15:0] A_out[0:31],     // Row outputs for matrix A
    output logic [15:0] B_out[0:31],     // Column outputs for matrix B
    output complete_flag                 // Complete flag when all PEs finish
);

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

    // Generate staggered FIFO injections for Matrix B (columns)
    genvar j;
    generate
        for (j = 0; j < 32; j++) begin : B_fifos
            fifo_inject #(
                .ZERO_DELAY(j)                 // Stagger delay for each column of B
            ) B_fifo (
                .clk(clk),
                .rst_n(rst_n),
                .load(load),
                .read_en(read_en),
                .data_in(B_in),                // Parallel load for column data
                .data_out(B_out[j])            // Individual output for each column
            );
        end
    endgenerate

endmodule

module conv2d (
    input logic [15:0] input_matrix [0:226][0:226], // 227x227 input matrix
    input logic [15:0] kernel [0:10][0:10],          // 11x11 kernel
    output logic [15:0] output_matrix [0:54][0:54]   // 55x55 output matrix
);

    // Parameter definitions
    parameter int INPUT_HEIGHT = 227;
    parameter int INPUT_WIDTH = 227;
    parameter int KERNEL_SIZE = 11;
    parameter int STRIDE = 4;
    parameter int OUTPUT_HEIGHT = 55;
    parameter int OUTPUT_WIDTH = 55;

    // Combinational logic block for convolution
    always_comb begin
        // Initialize output_matrix to zero
        for (int i = 0; i < OUTPUT_HEIGHT; i++) begin
            for (int j = 0; j < OUTPUT_WIDTH; j++) begin
                logic [15:0] conv_sum = 0; // Reset sum for the current position

                // Perform convolution
                for (int m = 0; m < KERNEL_SIZE; m++) begin
                    for (int n = 0; n < KERNEL_SIZE; n++) begin
                        conv_sum += input_matrix[i * STRIDE + m][j * STRIDE + n] * kernel[m][n];
                    end
                end

                output_matrix[i][j] = conv_sum; // Assign the convolution sum to output
            end
        end
    end

endmodule

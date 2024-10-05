module conv1(
    input logic [15:0] input_matrix [0:226][0:226][0:2], // 227x227 input matrix with 3 channels (RGB)
    input logic [15:0] kernel [0:10][0:10][0:2],          // 11x11 kernel with 3 channels
    output logic [15:0] output_matrix [0:54][0:54]       // 55x55 output matrix
);

    // Parameter definitions
    parameter int INPUT_HEIGHT = 227;
    parameter int INPUT_WIDTH = 227;
    parameter int KERNEL_SIZE = 11;
    parameter int STRIDE = 4;
    parameter int OUTPUT_HEIGHT = 55;
    parameter int OUTPUT_WIDTH = 55;

    // Declare logic variables for summation
    logic [15:0] conv_sum;    // Total sum for the current output position
    logic [15:0] channel_sum; // Sum for each RGB channel

    // Combinational logic block for convolution
    always_comb begin

        // Initialize output_matrix to zero
        for (int i = 0; i < OUTPUT_HEIGHT; i++) begin
            for (int j = 0; j < OUTPUT_WIDTH; j++) begin
                
                conv_sum = 0; // Reset total sum for the current position

                // Perform convolution across all channels
                for (int c = 0; c < 3; c++) begin // Iterate over the 3 channels (RGB)
                    channel_sum = 0; // Reset channel sum for each channel

                    // Perform convolution for the current channel
                    for (int m = 0; m < KERNEL_SIZE; m++) 

                        for (int n = 0; n < KERNEL_SIZE; n++) 

                            // Check to prevent out-of-bounds access
                            if ((i * STRIDE + m) < INPUT_HEIGHT && (j * STRIDE + n) < INPUT_WIDTH) 
                                channel_sum += input_matrix[i * STRIDE + m][j * STRIDE + n][c] * kernel[m][n][c];

                    // Add the channel result to the overall convolution sum
                    conv_sum += channel_sum;
                end
                // Assign the total convolution sum to the output matrix
                output_matrix[i][j] = conv_sum; 
            end
        end
    end

endmodule

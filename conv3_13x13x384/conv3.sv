module conv3(
    input logic [15:0] input_matrix [0:12][0:12][0:255], // 13 x 13 input from the previous conv layer with 256 channels
    input logic [15:0] kernel [0:2][0:2][0:255],         // 3x3 kernels with 256 channels
    output logic [15:0] output_matrix [0:12][0:12]      // 13 x 13 output matrix
);

    // Parameter definitions
    parameter int INPUT_HEIGHT = 13;  // Size of conv1 input
    parameter int INPUT_WIDTH = 13;   // Size of conv1 input
    parameter int PADDING = 1;         // Define padding size
    parameter int KERNEL_SIZE = 3;     // Kernel size is 5x5
    parameter int STRIDE = 1;          // Set stride to 1 for proper convolution
    parameter int OUTPUT_HEIGHT = (INPUT_HEIGHT + 2 * PADDING - KERNEL_SIZE) / STRIDE + 1; // Calculate output height
    parameter int OUTPUT_WIDTH = (INPUT_WIDTH + 2 * PADDING - KERNEL_SIZE) / STRIDE + 1;   // Calculate output width

    // Declare logic variables for summation
    logic [15:0] conv_sum;    // Total sum for the current output position
    logic [15:0] channel_sum; // Sum for each channel

    // Combinational logic block for convolution
    always_comb begin
        // Initialize output_matrix to zero
        for (int i = 0; i < OUTPUT_HEIGHT; i++) begin
            for (int j = 0; j < OUTPUT_WIDTH; j++) begin
                output_matrix[i][j] = 0; // Initialize each position to zero
                
                // Reset total sum for the current position
                conv_sum = 0; 

                // Perform convolution across all channels
                for (int c = 0; c < 256; c++) begin // Iterate over the 256 channels
                    channel_sum = 0; // Reset channel sum for each channel

                    // Perform convolution for the current channel
                    for (int m = 0; m < KERNEL_SIZE; m++) begin
                        for (int n = 0; n < KERNEL_SIZE; n++) begin
                            // Calculate the padded indices
                            int padded_i = i * STRIDE + m - PADDING; // Adjust for padding
                            int padded_j = j * STRIDE + n - PADDING; // Adjust for padding

                            // Check to prevent out-of-bounds access in the input matrix
                            if ((padded_i >= 0) && (padded_i < INPUT_HEIGHT) &&
                                (padded_j >= 0) && (padded_j < INPUT_WIDTH)) begin
                                // Access the input_matrix without padding
                                channel_sum += input_matrix[padded_i][padded_j][c] * kernel[m][n][c];
                            end
                        end
                    end
                    // Add the channel result to the overall convolution sum
                    conv_sum += channel_sum;
                end
                // Assign the total convolution sum to the output matrix
                output_matrix[i][j] = conv_sum; 
            end
        end
    end

endmodule

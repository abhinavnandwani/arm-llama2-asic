module conv1_wrapper (
    input [15:0] input_img [0:12][0:12][0:255],   // Input: 13x13x256
    input [15:0] kernal1 [0:383][0:2][0:2][0:255], // Kernel: (3x3x256)x384
    output [15:0] out_layer1 [0:12][0:12][0:383]   // Output after RELU: 13x13x384
);

    // Intermediate logic arrays
    logic [15:0] conv_out [0:383][0:12][0:12]; // Output from conv layer (354 channels, 13x13 each)
    logic [15:0] relu_out [0:12][0:12][0:383]; // Output from ReLU (13x13 for each of 354 channels)

    genvar i, j, k;

    // Instantiate the conv1 modules for each output channel
    generate
        for (k = 0; k < 384; k++) begin : conv_channel
            conv1 conv_inst (
                .input_matrix(input_img),              // Connect input image
                .kernel(kernal1[k]),                   // Connect specific kernel for this channel
                .output_matrix(conv_out[k])            // Connect specific output for this channel
            );
        end
    endgenerate

    // Instantiate the ReLU module for each output channel
    generate
        for (i = 0; i < 3; i++) begin : row
            for (j = 0; j < 3; j++) begin : col
                for (k = 0; k < 354; k++) begin : channel
                    relu relu_inst (
                        .in(conv_out[k][i][j]),           // Input from the convolution output
                        .out(relu_out[i][j][k])           // Output from ReLU
                    );
                end
            end
        end
    endgenerate

    // Assign the final output after ReLU to the output layer
    //assign out_layer1 = relu_out;  // Direct assignment to output layer

endmodule

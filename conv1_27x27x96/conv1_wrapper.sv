module conv1_wrapper (
    input [15:0] input_img [0:226][0:226][0:2],   // Input: 227x227x3
    input [15:0] kernal1 [0:95][0:10][0:10][0:2], // Kernel: (11x11x3)x96
    output [15:0] out_layer1 [0:26][0:26][0:95]   // Output after RELU: 27x27x96
);

    // Intermediate logic arrays
    logic [15:0] conv_out [0:95][0:54][0:54]; // Output from conv layer (95 channels, 55x55 each)
    logic [15:0] relu_out [0:54][0:54][0:95]; // Output from ReLU (55x55 for each of 96 channels)

    genvar i, j, k;

    // Instantiate the conv1 modules for each output channel
    generate
        for (k = 0; k < 96; k++) begin : conv_channel
            conv1 conv_inst (
                .input_matrix(input_img),              // Connect input image
                .kernel(kernal1[k]),                   // Connect specific kernel for this channel
                .output_matrix(conv_out[k])            // Connect specific output for this channel
            );
        end
    endgenerate

    // Instantiate the ReLU module for each output channel
    generate
        for (i = 0; i < 55; i++) begin : row
            for (j = 0; j < 55; j++) begin : col
                for (k = 0; k < 96; k++) begin : channel
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

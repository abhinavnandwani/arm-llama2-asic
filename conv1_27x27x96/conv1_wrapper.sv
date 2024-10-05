module conv1_wrapper(
    input [15:0] input_img [0:226][0:226][0:2], // Input image (227x227x3)
    input [15:0] kernal1 [0:10][0:10][0:2][0:95], // Kernel (11x11x3)x96
    output [15:0] out_layer1 [0:26][0:26][0:95] // Output layer (27x27x96)
);

    // Intermediate signals
    logic [15:0] conv_out [0:54][0:54][0:95]; // Convolution output
    logic [15:0] relu_out [0:54][0:54][0:95]; // ReLU output

    // Instantiate convolution module
    conv1 conv (
        .input_matrix(input_img),
        .kernel(kernal1),
        .output_matrix(conv_out)
    );

    // Instantiate ReLU module for each channel
    genvar i, j, k;
    generate
        for (i = 0; i < 55; i++) begin : row
            for (j = 0; j < 55; j++) begin : col
                for (k = 0; k < 96; k++) begin : channel
                    relu relu_inst (
                        .in(conv_out[i][j][k]),          // Input from the convolution output
                        .out(relu_out[i][j][k])          // Output from ReLU
                    );
                end
            end
        end
    endgenerate

    // Assign the final output after ReLU to out_layer1
    //assign out_layer1 = relu_out;

endmodule

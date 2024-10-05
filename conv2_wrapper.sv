module conv1_wrapper(input_img,kernal1,out_layer1);

    //Layer 1
    input [15:0] input_img [0:26][0:26][0:95];  //[Input] ==> 27x27x96
    input [15:0] kernal1 [0:4][0:4][0:95][0:255]; //[Kernal] (5x5x96)x256

    output [15:0] out_layer1 [0:12][0:12][0:255] // Output after RELU and norm 27x27x96

    logic [15:0] conv_out [0:26][0:26][0:255];

    conv1 conv [95:0](.input_matrix(input_img), .kernel(kernal1), .output_matrix(conv_out));


    // Instantiate the ReLU module for each channel
    genvar i, j, k;
    generate
        for (i = 0; i < 27; i++) begin : row
            for (j = 0; j < 27; j++) begin : col
                for (k = 0; k < 256; k++) begin : channel
                    relu relu_inst (
                        .in(conv_out[i][j][k]),          // Input from the convolution output
                        .out(relu_out[i][j][k])          // Output from ReLU
                    );
                end
            end
        end
    endgenerate

    // implement Local Response Normalization
    assign out_layer1 = conv_out;
endmodule 

module tb_conv1_wrapper;
    reg [15:0] input_img [0:226][0:226][0:2]; // Input image
    reg [15:0] kernal1 [0:95][0:10][0:10][0:2]; // Kernel
    wire [15:0] out_layer1 [0:26][0:26][0:95]; // Output after RELU

    // Instantiate the wrapper module
    conv1_wrapper uut (
        .input_img(input_img),
        .kernal1(kernal1),
        .out_layer1(out_layer1)
    );

    initial begin
        // Initialize input_img and kernal1 with test data
        // Here you can replace this random initialization with meaningful data
        for (int i = 0; i < 227; i++) begin
            for (int j = 0; j < 227; j++) begin
                for (int c = 0; c < 3; c++) begin
                    input_img[i][j][c] = $random; // Replace with actual test values if needed
                end
            end
        end

        for (int k = 0; k < 96; k++) begin
            for (int i = 0; i < 11; i++) begin
                for (int j = 0; j < 11; j++) begin
                    for (int c = 0; c < 3; c++) begin
                        kernal1[k][i][j][c] = $random; // Replace with actual test values if needed
                    end
                end
            end
        end

        // Run the simulation for a certain time
        #10;

        // Add code here to verify the output `out_layer1` for correctness
        // You can use assertions or print statements as needed

        $finish; // End the simulation
    end
endmodule

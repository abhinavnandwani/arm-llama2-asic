module tb_conv1_wrapper;
    reg [15:0] input_img [0:226][0:226][0:2]; // Input image (227x227x3)
    reg [15:0] kernal1 [0:95][0:10][0:10][0:2]; // Kernel (96 x 11 x 11 x 3)
    wire [15:0] out_layer1 [0:26][0:26][0:95]; // Output after RELU (27x27x96)

    // Instantiate the wrapper module
    conv1_wrapper uut (
        .input_img(input_img),
        .kernal1(kernal1),
        .out_layer1(out_layer1)
    );

    initial begin
        // Initialize input_img with a test pattern
        for (int i = 0; i < 227; i++) begin
            for (int j = 0; j < 227; j++) begin
                for (int c = 0; c < 3; c++) begin
                    input_img[i][j][c] = i + j + c; // Simple pattern for testing
                end
            end
        end

        // Initialize kernal1 with random values or a specific test pattern
        for (int k = 0; k < 96; k++) begin
            for (int i = 0; i < 11; i++) begin
                for (int j = 0; j < 11; j++) begin
                    for (int c = 0; c < 3; c++) begin
                        kernal1[k][i][j][c] = $random % 256; // Random values (0-255)
                    end
                end
            end
        end

        // Wait for a short time to allow processing
        #10;

        // Monitor inputs and outputs
        $monitor("Time: %0t | Input [0][0][0]: %0d | Output [0][0][0]: %0d | Output [26][26][95]: %0d",
                 $time, input_img[0][0][0], out_layer1[0][0][0], out_layer1[26][26][95]);

        // Run the simulation for a certain time to analyze outputs
        #100; // Change this duration as needed for your tests

        // Optionally, add assertions or checks for expected output values here

        // Finish the simulation
        $finish; 
    end

    // Optional: Dump waveforms for further analysis
    initial begin
        $dumpfile("conv1_wrapper_tb.vcd"); // VCD file for waveform
        $dumpvars(0, tb_conv1_wrapper); // Dump all variables in this testbench
    end

endmodule

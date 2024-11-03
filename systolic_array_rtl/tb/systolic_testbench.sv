module systolic_testbench();

    logic clk, rst_n, load, read_en;
    logic [15:0] A_in [0:31];           // Matrix A input
    logic [15:0] B_in [0:31];           // Matrix B input
    logic [15:0] A_out[0:31];           // A outputs from control
    logic [15:0] B_out[0:31];           // B outputs from control
    logic [31:0] sum_out[0:31][0:31];   // Output sum from systolic array
    logic complete_flag;                // Flag to indicate completion

    // Instantiate systolic_control
    systolic_control sys_ctrl(
        .clk(clk),
        .rst_n(rst_n),
        .load(load),
        .read_en(read_en),
        .A_in(A_in),
        .B_in(B_in),
        .A_out(A_out),
        .B_out(B_out),
        .complete_flag(complete_flag)
    );

    // Instantiate systolic array
    systolic_mult systolic_array(
        .clk(clk),
        .rst_n(rst_n),
        .A_west(A_out),
        .B_north(B_out),
        .sum_out(sum_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // File reading procedure
    initial begin
        clk = 0;
        rst_n = 0;
        load = 0;
        read_en = 0;

        // Apply reset
        #10;
        rst_n = 1;
        #10;

        // Load matrices A and B from text files
        $readmemb("matrixA.txt", A_in); // Load Matrix A values
        $readmemb("matrixB.txt", B_in); // Load Matrix B values

        // Trigger load and read operations
        load = 1;
        #10;
        load = 0;
        read_en = 1;

        // Wait for completion of multiplication
        wait(complete_flag);
        #10;

        // Display results
        $display("Matrix Multiplication Result:");
        for (int i = 0; i < 32; i++) begin
            for (int j = 0; j < 32; j++) begin
                $display("sum_out[%0d][%0d] = %0d", i, j, sum_out[i][j]);
            end
        end

        $stop;
    end

endmodule

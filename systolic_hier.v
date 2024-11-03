module systolic_hier (
    input wire clk,                  // System clock
    input wire reset_n,              // Active low reset
    input wire [31:0] data_in,       // Data input from ARM Cortex-M3
    output reg [31:0] data_out,       // Data output to ARM Cortex-M3
    input wire start,                // Start signal from ARM Cortex-M3
    output reg done,                 // Done signal to ARM Cortex-M3
    output reg [31:0] status,        // Status register
    output reg [31:0] result_matrix[0:1023] // Result matrix storage (32x32)
);

    // Internal memory for matrices
    reg [15:0] matrix_a [0:1023];    // Matrix A (32x32) in 16-bit words
    reg [15:0] matrix_b [0:1023];    // Matrix B (32x32) in 16-bit words

    // Control and status registers
    reg [31:0] control_reg;          // Control register
    reg [31:0] status_reg;           // Status register

    // States
    reg [1:0] state;                 // State for processing
    localparam IDLE = 2'b00,         // Idle state
               LOAD_A = 2'b01,      // Load Matrix A state
               LOAD_B = 2'b10,      // Load Matrix B state
               PROCESS = 2'b11;      // Processing state

    // State machine for matrix multiplication
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= IDLE;
            done <= 1'b0;
            status <= 32'b0;
            control_reg <= 32'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= LOAD_A; // Move to load Matrix A
                        done <= 1'b0;    // Clear done flag
                    end
                end

                LOAD_A: begin
                    // Load Matrix A
                    integer i;
                    for (i = 0; i < 1024; i = i + 1) begin
                        matrix_a[i] <= data_in[i*16 +: 16]; // Load 16-bit elements
                    end
                    state <= LOAD_B; // Move to load Matrix B
                end

                LOAD_B: begin
                    // Load Matrix B
                    integer j;
                    for (j = 0; j < 1024; j = j + 1) begin
                        matrix_b[j] <= data_in[j*16 +: 16]; // Load 16-bit elements
                    end
                    state <= PROCESS; // Move to processing
                end

                PROCESS: begin
                    // Perform matrix multiplication here
                    integer k, row, col;
                    for (row = 0; row < 32; row = row + 1) begin
                        for (col = 0; col < 32; col = col + 1) begin
                            result_matrix[row*32 + col] = 32'b0; // Clear result
                            for (k = 0; k < 32; k = k + 1) begin
                                result_matrix[row*32 + col] = 
                                    result_matrix[row*32 + col] + 
                                    matrix_a[row*32 + k] * matrix_b[k*32 + col]; // Multiply
                            end
                        end
                    end
                    status <= 32'h00000001; // Indicate processing complete
                    done <= 1'b1; // Set done flag
                    state <= IDLE; // Go back to idle state
                end

                default: state <= IDLE; // Safety case
            endcase
        end
    end

    // Output the result when done
    always @(posedge clk) begin
        if (done) begin
            data_out <= result_matrix[0]; // Example: Output the first result
        end
    end
endmodule

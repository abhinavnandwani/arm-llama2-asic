/* 
    Author          : Abhinav Nandwani
    Filename        : fifo_inject.sv
    Description     : This module acts as a fifo buffer to inject data into the systolic array in a stagerred fashion.   
*/

module fifo_inject #(
    parameter ZERO_DELAY = 0
) (
    input logic clk,
    input logic rst_n,
    input logic load,
    input logic read_en,
    input logic [15:0] data_in [0:31],  // Parallel load input for the row or column
    output logic [15:0] data_out,        // Output for systolic array
    output logic complete_flag                     // Flag to indicate when 64 cycles are complete
);

    logic [15:0] fifo [0:63];           // depth is 64 cause last row/col will have a 32 clk cycle delay. 
    logic [5:0] read_ptr;               // 6-bit read pointer to cover depth of 64

    // Initialization of FIFO contents and read pointer on reset or load
    always_ff @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            read_ptr <= 0;
            complete_flag <= 0;
        end else if (load) 
            for (int i = 0; i < 64; i++) 
                fifo[i] <= (i < ZERO_DELAY) ? 0 : data_in[i - ZERO_DELAY]; // Fill with zeros, then data
        else if (read_en) begin
            data_out <= fifo[read_ptr];
            read_ptr <= read_ptr + 1;
            complete_flag <= (read_ptr == (64 - ZERO_DELAY - 1)); // Flag high after last data element is output
        end

endmodule



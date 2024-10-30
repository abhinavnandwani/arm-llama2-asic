void init_matrix_multiplier();               // Initialize the accelerator
void start_matrix_multiplication();          // Start the multiplication operation
void set_matrix_data(float* matrixA, float* matrixB); // Send data to FPGA
int is_multiplication_complete();            // Check if multiplication is done
void get_matrix_result(float* result);       // Retrieve the result from FPGA

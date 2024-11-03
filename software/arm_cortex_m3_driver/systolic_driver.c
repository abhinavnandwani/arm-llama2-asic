#include <stdint.h>
#include <stdbool.h>

// Define hardware register addresses (adjust these based on your actual memory map)
#define SYSTOLIC_ARRAY_BASE       0x40000000
#define MATRIX_A_BASE             (SYSTOLIC_ARRAY_BASE + 0x0000)
#define MATRIX_B_BASE             (SYSTOLIC_ARRAY_BASE + 0x1000)
#define RESULT_MATRIX_BASE        (SYSTOLIC_ARRAY_BASE + 0x2000)
#define CONTROL_REGISTER          (SYSTOLIC_ARRAY_BASE + 0x3000)
#define STATUS_REGISTER           (SYSTOLIC_ARRAY_BASE + 0x3004)

// Control and status flags
#define CONTROL_START             0x01
#define STATUS_COMPLETE           0x01

// Matrix dimensions (adjust based on your array size)
#define MATRIX_SIZE               32  // Assuming 32x32 matrix
#define EMBEDDING_SIZE            32  // Change as needed

// Prototypes
void systolic_array_load_matrix(int16_t *matrix, uint32_t base_address);
void systolic_array_start();
bool systolic_array_is_complete();
void systolic_array_read_result(int32_t *result_matrix);

// Function to perform matrix multiplication using systolic array
void systolic_array_multiply(int16_t *matrix_a, int16_t *matrix_b, int32_t *result) {
    // Load matrices A and B into systolic array memory
    systolic_array_load_matrix(matrix_a, MATRIX_A_BASE);
    systolic_array_load_matrix(matrix_b, MATRIX_B_BASE);

    // Start systolic array computation
    systolic_array_start();

    // Wait for computation to complete
    while (!systolic_array_is_complete()) {}

    // Read result from systolic array memory
    systolic_array_read_result(result);
}

// Helper function to load a matrix into systolic array
void systolic_array_load_matrix(int16_t *matrix, uint32_t base_address) {
    for (int i = 0; i < MATRIX_SIZE * MATRIX_SIZE; i++) {
        *((volatile int16_t *)(base_address + i * sizeof(int16_t))) = matrix[i];
    }
}

// Function to start the systolic array computation
void systolic_array_start() {
    *((volatile uint32_t *)CONTROL_REGISTER) = CONTROL_START;
}

// Function to check if the systolic array has completed its computation
bool systolic_array_is_complete() {
    return (*((volatile uint32_t *)STATUS_REGISTER) & STATUS_COMPLETE) != 0;
}

// Helper function to read result matrix from systolic array
void systolic_array_read_result(int32_t *result_matrix) {
    for (int i = 0; i < MATRIX_SIZE * MATRIX_SIZE; i++) {
        result_matrix[i] = *((volatile int32_t *)(RESULT_MATRIX_BASE + i * sizeof(int32_t)));
    }
}

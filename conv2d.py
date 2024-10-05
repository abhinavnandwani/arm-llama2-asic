def conv2d(input_matrix,kernel):

    input_height = 277
    input_width = 277
    kernel_size = 11

    stride = 4
    padding = 0
    
    output_height = 55
    output_width = 55

    output_matrix = [[0 for _ in range(output_width)] for _ in range(output_height)]

    # Perform the convolution
    for i in range(output_height):
        for j in range(output_width):
            conv_sum = 0
            # Multiply the kernel with the corresponding region of the input matrix
            for m in range(kernel_size):
                for n in range(kernel_size):
                    conv_sum += input_matrix[i * stride + m][j * stride + n] * kernel[m][n]
            output_matrix[i][j] = conv_sum

    return output_matrix


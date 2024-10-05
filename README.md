# AlexNet AI Accelerator

## Overview

The **AlexNet AI Accelerator** is a specialized hardware implementation designed to efficiently perform image classification tasks using the AlexNet Convolutional Neural Network (CNN) architecture. This project leverages the computational power of Field Programmable Gate Arrays (FPGAs) to accelerate deep learning processes, specifically focusing on the first layer of the AlexNet model, which includes multiple convolutional layers followed by non-linear activation functions.

## Functional Schematic

![Functional Schematic](high_level_alexnet.png)

## Architecture Components

1. **Input Layer**:
   - The system accepts input images of size 227x227 pixels with 3 RGB channels. This initial preprocessing stage ensures that images fed into the model conform to the expected input dimensions.

2. **Convolutional Layers**:
   - The accelerator implements multiple convolutional layers, with the first layer featuring 96 convolutional kernels (filters) of size 11x11. Each kernel operates over the input image, producing a 55x55 output for each filter.
   - Each convolution operation is designed as a separate module, allowing for scalability and flexibility. The output from these layers is then passed through non-linear activation functions.

3. **Activation Function (ReLU)**:
   - After each convolution operation, the Rectified Linear Unit (ReLU) activation function is applied. This function introduces non-linearity into the model, enabling it to learn complex patterns in the data. The ReLU function outputs the input value directly if it is positive; otherwise, it outputs zero.

4. **Pooling Layers** (not depicted in the schematic):
   - Following the activation layers, pooling operations (like Max Pooling) can be integrated to reduce the spatial dimensions of the feature maps, leading to reduced computation and improved efficiency.

5. **Parameter Memory**:
   - The architecture utilizes dedicated memory blocks to store the kernels (weights) used in the convolutional layers. This allows for quick retrieval and use during the convolution operations.

6. **Output Layer**:
   - The outputs from all convolutional layers are combined and can be forwarded to subsequent layers (e.g., fully connected layers) or directly used for classification tasks.

## Benefits

- **Performance**: By using FPGA technology, the AlexNet AI Accelerator can significantly speed up inference times for image classification tasks, making it suitable for real-time applications.
- **Scalability**: The modular design allows for easy addition of more layers or adjustment of parameters, enabling customization based on specific application needs.
- **Energy Efficiency**: FPGAs consume less power compared to traditional CPU or GPU implementations, making the system more energy-efficient.

## Conclusion

The **AlexNet AI Accelerator** represents a powerful tool for leveraging deep learning in hardware. With its efficient architecture and modular design, it is capable of delivering high performance for image classification tasks, opening new possibilities in AI applications ranging from autonomous vehicles to real-time image processing.

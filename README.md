

All synthesizable code is written in **SystemVerilog**.



## Architecture
![Architecture](architecture.png)

# ARM Cortex-M3 LLaMA 2 on Systolic Array Accelerator

This repository contains the code and hardware description files to implement a scaled-down 50 million-parameter variant of the LLaMA 2 model on an ARM Cortex-M3 soft core. Using a custom systolic array for efficient matrix multiplication, the project allows for LLaMA 2 inference on resource-constrained hardware such as FPGA, with Vivado as the deployment tool.

## Repository Structure

### `/hardware/`
Contains HDL (SystemVerilog) files that define the systolic array and its supporting modules:
- **`pe.sv`**: Defines a single processing element (PE) within the systolic array, which performs an INT8 multiply-accumulate (MAC) operation.
- **`systolic_mult.sv`**: Defines the full systolic array as a 32x32 matrix multiplier for INT8 operations, with each PE performing a MAC operation.
- **`fifo_inject.sv`**: Implements FIFO buffers to inject data into the systolic array in a staggered, pipelined fashion, ensuring data availability for each PE and improving throughput.
- **`systolic_control.sv`**: Manages the control logic for matrix data flow into the systolic array, coordinating data injection and handling completion flags.

### `/software/`
Contains driver and inference code for the ARM Cortex-M3 to control the systolic array and perform LLaMA 2 inference:
- **`driver.c`**: Driver code to interface with the systolic array. It manages matrix loading, triggering computations, and retrieving results.
- **`run.c`**: High-level inference code inspired by [karpathy/llama2.c](https://github.com/karpathy/llama2.c). This file includes a scaled-down LLaMA 2 model and offloads matrix multiplication tasks to the systolic array driver.
- **`utils.c`**: Utility functions for quantization, dequantization, and data preparation, ensuring model weights and input data are correctly formatted for INT8 operations.

### `/scripts/`
Python scripts for pre-processing model weights and converting them to a quantized format suitable for loading onto the FPGA.

## Key Features

1. **Custom Systolic Array Accelerator**: A 32x32 systolic array optimized for high-speed INT8 matrix multiplication, allowing high-throughput and low-power inference crucial for LLaMA 2 computations.
2. **ARM Cortex-M3 Integration**: Driver code for the ARM Cortex-M3 soft core to manage the systolic array, handle data flow, trigger computations, and retrieve results, enabling efficient control and minimal CPU overhead.
3. **Quantized LLaMA 2 Model**: A scaled-down, quantized 50M parameter LLaMA 2 model, adapted to utilize INT8 precision. This allows the model to run on low-power FPGA-based systems.
4. **Vivado Deployment**: All code is compatible with Vivado for easy FPGA synthesis and deployment.


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

Inspired by [karpathy/llama2.c](https://github.com/karpathy/llama2.c).


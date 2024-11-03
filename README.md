

All synthesizable code is written in **SystemVerilog**.



## Architecture
![Architecture](architecture.png)

## Components
- **Systolic Array**: A 32x32 matrix multiplication unit for INT8 operations, capable of executing 1024 MAC operations per cycle.
- **Processing Element (PE)**: Each PE performs Multiply-Accumulate operations, managing inputs from the west (row) and north (column) sides.
- **FIFO Injectors**: FIFO modules load input data into the systolic array, with configurable zero delays for synchronization.
- **Control Module**: Orchestrates the data flow, managing states for loading, reading, and multiplying data.

## Operation
1. **Data Injection**: Matrices A and B are loaded into FIFOs. Data is injected in a staggered manner.
2. **Multiplication**: The systolic array performs matrix multiplication once data is loaded.
3. **Output**: A 32x32 matrix of multiplication results is generated.

## Usage
- Load matrices A and B into the FIFO injectors.
- Start the multiplication process.
- Retrieve the output from the systolic array.

## Requirements
- SystemVerilog synthesis toolchain
- Hardware simulation environment (e.g., ModelSim, VCS)

## License
This project is licensed under the MIT License.

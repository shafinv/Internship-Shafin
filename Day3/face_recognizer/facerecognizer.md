# Face Recognition Data Pipeline Using FIFO and FSM

A Verilog HDL implementation of a **Face Recognition Data Pipeline** that captures continuous 8-bit data from a face detection stage, buffers it using a FIFO memory, and releases validated data at a controlled rate using a Finite State Machine (FSM).

---

## 📖 Overview

In real-time face recognition and image-processing systems, data is often generated faster than it can be processed by downstream modules. To handle this rate mismatch, buffering and flow control mechanisms are required.

This project implements a pipelined architecture consisting of:

* Face Detection Input Stage
* Synchronous FIFO Buffer
* FSM-Based Output Controller

The system continuously receives 8-bit data every clock cycle and produces valid output data once every three clock cycles.

---

## ✨ Features

* Continuous 8-bit data acquisition
* FIFO-based buffering
* Hardware flow control
* FSM-controlled output pacing
* Overflow and underflow protection
* Synchronous operation
* Synthesizable Verilog HDL design
* FPGA implementation ready

---

## 🧠 System Concept

The design simulates a face recognition processing pipeline where:

1. Face detection hardware continuously generates pixel or feature data.
2. Incoming data is temporarily stored in a FIFO.
3. An FSM extracts data at a slower controlled rate.
4. Valid data is presented to the next processing stage.

This architecture prevents data loss while maintaining deterministic output timing.

---

## 🏗️ System Architecture

```text
                  +----------------------+
                  | Face Detection Stage |
                  +----------------------+
                             |
                             |
                             v
                  +----------------------+
                  |      FIFO Buffer     |
                  |       (8 x 8)        |
                  +----------------------+
                             |
                             |
                             v
                  +----------------------+
                  |  FSM Rate Controller |
                  +----------------------+
                             |
                             |
                             v
                    Face Recognition Output
```

---

## 📂 Module Description

### Module 1: Face Detection Interface

#### Purpose

Acts as the entry point of the pipeline and captures incoming face detection data.

#### Inputs

| Signal    | Width |
| --------- | ----- |
| P_in      | 8-bit |
| clk       | 1-bit |
| rst       | 1-bit |
| fifo_full | 1-bit |

#### Outputs

| Signal    | Width |
| --------- | ----- |
| P_out     | 8-bit |
| wrenabler | 1-bit |

#### Operation

* Samples incoming data on every clock cycle.
* Transfers data to FIFO.
* Generates FIFO write enable.
* Stops writing whenever FIFO becomes full.

#### Flow Control

```verilog
if(fifo_full)
    wrenabler <= 1'b0;
```

This prevents buffer overflow.

---

### Module 2: FIFO Buffer

#### Purpose

Stores incoming face recognition data temporarily.

#### Specifications

| Parameter     | Value     |
| ------------- | --------- |
| Data Width    | 8 bits    |
| FIFO Depth    | 8 Entries |
| Write Pointer | 3 bits    |
| Read Pointer  | 3 bits    |

#### Empty Flag Logic

```verilog
assign empty = (wr_ptr == rd_ptr);
```

#### Full Flag Logic

```verilog
assign full = ((wr_ptr + 3'b001) == rd_ptr);
```

#### Features

* Circular buffer implementation
* Read and write operations
* Overflow protection
* Underflow protection

---

### Module 3: FSM Rate Controller

#### Purpose

Controls the output rate of the face recognition pipeline.

#### State Description

| State | Function                    |
| ----- | --------------------------- |
| 00    | Check FIFO and request data |
| 01    | FIFO latency wait state     |
| 10    | Output valid data           |

---

### State 00 – Request

Checks FIFO status.

```verilog
if(fifo_empty == 0)
    fifo_rd_en <= 1'b1;
```

---

### State 01 – Wait

Provides one clock cycle for FIFO read latency.

```verilog
fifo_rd_en <= 1'b0;
```

---

### State 10 – Output

Captures FIFO data and asserts the valid signal.

```verilog
data_out <= data_in;
data_valid <= 1'b1;
```

---

## 📁 Project Structure

```text
Face-Recognition-Pipeline/
│
├── src/
│   ├── input_facedetection.v
│   ├── fifo.v
│   ├── third_module_fsm.v
│   └── top_module.v
│
├── testbench/
│   └── top_module_tb.v
│
├── screenshots/
│   ├── rtl_schematic.png
│   ├── waveform.png
│   └── synthesis_report.png
│
└── README.md
```

---

## 🧪 Testbench Verification

The complete pipeline was verified using a behavioral testbench.

### Clock Generation

```verilog
always #5 clk = ~clk;
```

Clock Characteristics:

| Parameter    | Value   |
| ------------ | ------- |
| Clock Period | 10 ns   |
| Frequency    | 100 MHz |

---

### Reset Sequence

```verilog
rst = 1;
#20;
rst = 0;
```

During reset:

* FIFO pointers are cleared.
* FSM returns to State 00.
* Outputs are reset.

---

### Applied Input Data

The following data sequence was injected into the pipeline:

| Cycle | Input Data |
| ----- | ---------- |
| 1     | 01         |
| 2     | 02         |
| 3     | 03         |
| 4     | 04         |
| 5     | 05         |
| 6     | 06         |
| 7     | 07         |

Input data is applied on the negative edge of the clock to avoid race conditions.

---

## 📊 Simulation Results

### Input Stream

```text
01 → 02 → 03 → 04 → 05 → 06 → 07
```

### Output Stream

```text
01 → 02 → 03 → 04 → 05
```

### Waveform Analysis

The waveform confirms:

* Continuous data acquisition.
* Successful FIFO storage.
* Proper FIFO read operations.
* Correct FSM sequencing.
* Output throttling functionality.
* Valid pulse generation every third clock cycle.

### Output Valid Pattern

```text
0 0 1 0 0 1 0 0 1 ...
```

This verifies the required output rate control.

---


## 📈 Simulation Waveform


<img width="1279" height="444" alt="recognizer" src="https://github.com/user-attachments/assets/30a7980f-91a3-4036-a73e-ac232794a7cd" />


## 📉 Synthesis Results
<img width="1085" height="116" alt="reportrecog" src="https://github.com/user-attachments/assets/503eadde-2aca-42fa-9894-af2742568e7c" />
Synthesis was successfully completed using Xilinx Vivado.

### Resource Utilization

| Resource   | Utilization              |
| ---------- | ------------------------ |
| LUTs       | Refer Utilization Report |
| Flip-Flops | Refer Utilization Report |
| I/O Pins   | Refer Utilization Report |
| BRAM       | Refer Utilization Report |
| DSP        | Refer Utilization Report |

### Synthesis Status

```text
Synthesis Completed Successfully
```

---

## 🚀 How to Run

1. Open Xilinx Vivado.
2. Create a new RTL Project.
3. Add all source files.
4. Add `top_module_tb.v`.
5. Run Behavioral Simulation.
6. Verify FIFO operation and FSM output pacing.

---

## 🎯 Applications

* Face Recognition Systems
* Computer Vision Pipelines
* Image Processing Systems
* Embedded Vision Applications
* Real-Time Data Acquisition
* FPGA-Based AI Accelerators
* Streaming Data Processing

---

## 🔮 Future Enhancements

* Dynamic FIFO Depth
* Adjustable Output Rate Control
* Multi-Channel Data Support
* AXI Stream Interface
* Hardware Face Recognition Core Integration
* Performance Monitoring Logic

---

## 🛠️ Tools Used

* Verilog HDL
* Xilinx Vivado
* Behavioral Simulation
* RTL Synthesis

---

## 👨‍💻 Author

**Shafin V**

Department of Electronics and Communication Engineering

Government Engineering College Thrissur

---

## 📜 License

This project is intended for educational and academic purposes.

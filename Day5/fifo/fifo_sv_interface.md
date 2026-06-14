# FIFO Design and Verification Using SystemVerilog Interface (EDA Playground)

A SystemVerilog implementation of an **8×8 Synchronous First-In First-Out (FIFO) Memory** verified using a **SystemVerilog Interface-based Testbench** on **EDA Playground**. The design demonstrates efficient buffering of sequential data using write/read pointers and validates FIFO operation through simulation.

---

## 📖 Overview

A First-In First-Out (FIFO) memory is a sequential storage element in which the first data written into memory is also the first data read out. FIFOs are extensively used in digital systems to synchronize data transfer between modules operating at different processing rates.

This project implements an **8-word × 8-bit synchronous FIFO** using SystemVerilog and verifies its functionality through an interface-based testbench. The FIFO supports sequential write and read operations while monitoring **FULL** and **EMPTY** conditions using dedicated status flags.

The design and verification were performed using **EDA Playground**.

---

## ✨ Features

* 8 × 8 FIFO Memory
* Synchronous Read and Write
* Write Pointer & Read Pointer
* FULL Flag Detection
* EMPTY Flag Detection
* SystemVerilog Interface-Based Verification
* EDA Playground Simulation
* Synthesizable Design

---

## 🧠 Theory

FIFO (First-In First-Out) memory temporarily stores data while maintaining the order in which data arrives.

The first value written into the FIFO becomes the first value available at the output during read operations.

### Memory Organization

```text
Depth        : 8 Locations
Data Width   : 8 Bits
Write Pointer: 3 Bits
Read Pointer : 3 Bits
```

---

### Write Operation

When

```text
wrenb = 1
```

and the FIFO is not full, incoming data is written into memory.

```verilog
mem[wr_ptr] <= data_in;
wr_ptr <= wr_ptr + 1;
```

---

### Read Operation

When

```text
rdenb = 1
```

and the FIFO is not empty, data is read from memory.

```verilog
data_out <= mem[rd_ptr];
rd_ptr <= rd_ptr + 1;
```

---

### Empty Condition

The FIFO is empty whenever both pointers are equal.

```verilog
empty = (wr_ptr == rd_ptr);
```

---

### Full Condition

The FIFO is full when the next write pointer reaches the current read pointer.

```verilog
full = ((wr_ptr + 1) == rd_ptr);
```

---

## 🏗️ FIFO Architecture

```text
                 +-----------------------+
                 |      FIFO Memory      |
                 |       8 × 8 RAM       |
                 |                       |
Data In -------->|                       |
Write Enable --->|                       |
Read Enable ---->|                       |
Clock ---------->|                       |
Reset ---------->|                       |
                 |                       |
                 |                       |----> Data Out
                 |                       |
                 | FULL Flag             |
                 | EMPTY Flag            |
                 +-----------------------+
```

---

## 📂 Inputs and Outputs

### Inputs

| Signal  | Width | Description       |
| ------- | ----- | ----------------- |
| clk     | 1-bit | System clock      |
| rst     | 1-bit | Active-high reset |
| wrenb   | 1-bit | Write enable      |
| rdenb   | 1-bit | Read enable       |
| data_in | 8-bit | Input data        |

### Outputs

| Signal   | Width | Description     |
| -------- | ----- | --------------- |
| data_out | 8-bit | Output data     |
| full     | 1-bit | FIFO full flag  |
| empty    | 1-bit | FIFO empty flag |

---

## 📄 Design Implementation

### Memory Declaration

```systemverilog
reg [7:0] mem [7:0];
```

### Write Pointer

```systemverilog
reg [2:0] wr_ptr;
```

### Read Pointer

```systemverilog
reg [2:0] rd_ptr;
```

### Write Logic

```systemverilog
if(wrenb && !full)
begin
    mem[wr_ptr] <= data_in;
    wr_ptr <= wr_ptr + 1;
end
```

### Read Logic

```systemverilog
if(rdenb && !empty)
begin
    data_out <= mem[rd_ptr];
    rd_ptr <= rd_ptr + 1;
end
```

---

## 📡 SystemVerilog Interface

Instead of connecting every signal individually, a **SystemVerilog Interface** is used to group all FIFO signals into a single communication interface.

### Interface Signals

```systemverilog
interface fifo_if;

logic clk;
logic rst;

logic wrenb;
logic rdenb;

logic [7:0] data_in;
logic [7:0] data_out;

logic full;
logic empty;

endinterface
```

### Advantages of Using an Interface

* Reduces port connections.
* Improves code readability.
* Simplifies verification.
* Makes the testbench modular.
* Enables reusable verification environments.

---

## 📁 Project Structure

```text
FIFO-SystemVerilog/
│
├── design/
│   └── fifo.sv
│
├── testbench/
│   |
│   └── fifo_tbif.sv
│
└── README.md
```

---

## 🧪 Testbench Verification

The FIFO was verified using a SystemVerilog interface-based testbench on **EDA Playground**.

### Clock Generation

```systemverilog
always #5 fif.clk = ~fif.clk;
```

Clock Characteristics

| Parameter    | Value   |
| ------------ | ------- |
| Clock Period | 10 ns   |
| Frequency    | 100 MHz |

---

### Reset Sequence

```systemverilog
fif.rst = 1;
#10;
fif.rst = 0;
```

The reset clears the FIFO memory before normal operation begins.

---

### Write Operation

The following data values are written sequentially into the FIFO.

| Write Order | Data |
| ----------- | ---- |
| 1           | 01   |
| 2           | 02   |
| 3           | 03   |
| 4           | 04   |
| 5           | 05   |
| 6           | 06   |
| 7           | 07   |

After writing seven values, the **FULL** flag becomes active.

---

### Read Operation

After disabling write enable, read enable is asserted.

The FIFO outputs data in the same order in which it was written.

| Read Order | Output |
| ---------- | ------ |
| 1          | 01     |
| 2          | 02     |
| 3          | 03     |
| 4          | 04     |
| 5          | 05     |
| 6          | 06     |
| 7          | 07     |

This confirms First-In First-Out behavior.

---

## 📊 Simulation Results

Behavioral simulation was performed on **EDA Playground**.

### Console Output Verification

The simulation log confirms:

* Successful reset.
* Sequential write operations.
* Correct pointer updates.
* Sequential read operations.
* Proper FULL flag assertion.
* Proper EMPTY flag assertion.

### Waveform Analysis

The waveform verifies that:

* Data values **01–07** are written sequentially.
* Write pointer increments correctly.
* Read pointer increments during read operations.
* Output data follows FIFO order.
* FULL flag becomes HIGH after filling the FIFO.
* EMPTY flag becomes HIGH after all data is read.

### Simulation Summary

| Feature           | Status |
| ----------------- | ------ |
| Reset             | PASS   |
| Write Operation   | PASS   |
| Read Operation    | PASS   |
| FIFO Order        | PASS   |
| FULL Flag         | PASS   |
| EMPTY Flag        | PASS   |
| Pointer Operation | PASS   |

---

## 📷 Console Output

<img width="572" height="414" alt="fifo_if" src="https://github.com/user-attachments/assets/5e194610-4205-4e5a-9b27-f6b4900927da" />


## 📈 Simulation Waveform

<img width="1289" height="217" alt="fifo_ifwave" src="https://github.com/user-attachments/assets/57f05db1-a224-4173-b4fc-aacc3bd8abd7" />


## 🚀 How to Run

1. Open **EDA Playground**.
2. Select **SystemVerilog** as the language.
3. Add the following files:

   * `fifo.sv`
   * `fifo_tbif.sv`
4. Select a simulator (e.g., Icarus Verilog or QuestaSim, if available).
5. Run the simulation.
6. Observe the console output and waveform to verify FIFO operation.

---

## 🎯 Applications

* Data Buffering
* UART Communication
* Network Packet Queues
* Processor Pipelines
* Image Processing Systems
* Streaming Data Interfaces
* FPGA-Based Communication Systems

---

## 🔮 Future Enhancements

* Parameterized FIFO Depth
* Parameterized Data Width
* Dual-Clock Asynchronous FIFO
* Almost-Full and Almost-Empty Flags
* SystemVerilog Assertions (SVA)
* UVM-Based Verification Environment

---

## 🛠️ Tools Used

* SystemVerilog
* EDA Playground
* Waveform Viewer
* Behavioral Simulation

---

## 👨‍💻 Author

**Shafin V**

Department of Electronics and Communication Engineering

Government Engineering College Thrissur

---

## 📜 License

This project is intended for educational and academic purposes.

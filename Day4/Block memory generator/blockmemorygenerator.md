# 8×8 Block RAM (BRAM) Using Verilog HDL

A Verilog HDL implementation of an **8×8 Block RAM (BRAM)** that stores and retrieves 8-bit data using separate read and write addresses. The memory supports synchronous write operations, synchronous read operations, and asynchronous active-low reset.

---

## 📖 Overview

Block RAM (BRAM) is a dedicated memory structure commonly used in FPGA designs for temporary data storage. It provides fast access, efficient memory utilization, and reliable storage for digital systems.

This project implements a custom **8-word × 8-bit memory module** that can:

* Store 8-bit data values.
* Access memory locations using 3-bit addresses.
* Perform synchronous write operations.
* Perform synchronous read operations.
* Reset all memory locations using an asynchronous reset.

The design serves as a fundamental building block for larger digital systems such as FIFOs, caches, buffers, and embedded memory subsystems.

---

## ✨ Features

* 8 memory locations
* 8-bit data width
* 3-bit addressing
* Synchronous write operation
* Synchronous read operation
* Asynchronous active-low reset
* Synthesizable Verilog HDL design
* FPGA implementation ready

---

## 🧠 Theory

Block RAM is a memory element used to store digital information inside FPGA-based systems.

### Memory Organization

```text id="3n0xlp"
Memory Depth  = 8 Locations
Memory Width  = 8 Bits
Address Width = 3 Bits
```

Memory Array:

```text id="0z7p8x"
Address    Data
----------------
000        mem[0]
001        mem[1]
010        mem[2]
011        mem[3]
100        mem[4]
101        mem[5]
110        mem[6]
111        mem[7]
```

---

### Write Operation

When:

```text id="l0g8uz"
wrenb = 1
```

the incoming data is stored at the specified write address on the rising edge of the clock.

```verilog id="z2j9u7"
mem[write_address] <= data_in;
```

---

### Read Operation

When:

```text id="3x8g1z"
wrenb = 0
```

the selected memory location is read and transferred to the output.

```verilog id="q7h1f4"
data_out <= mem[read_address];
```

---

### Reset Operation

The design uses an asynchronous active-low reset.

```verilog id="6m8jpk"
if(!arst)
```

During reset:

* All memory locations become zero.
* Output data becomes zero.

---

## 🏗️ Architecture

```text id="m7cf3g"
                +------------------+
                |     8x8 BRAM     |
                |                  |
 Data In ------>|                  |
 Write Addr --->|                  |
 Read Addr ---->|                  |
 WRENB -------->|                  |
 CLK ---------->|                  |
 ARST --------->|                  |
                |                  |
                |                  |----> Data Out
                +------------------+
```

---

## 📂 Inputs and Outputs

### Inputs

| Signal        | Width | Description                   |
| ------------- | ----- | ----------------------------- |
| clk           | 1-bit | Clock signal                  |
| arst          | 1-bit | Active-low asynchronous reset |
| wrenb         | 1-bit | Write enable                  |
| write_address | 3-bit | Write address                 |
| read_address  | 3-bit | Read address                  |
| data_in       | 8-bit | Input data                    |

### Outputs

| Signal   | Width | Description |
| -------- | ----- | ----------- |
| data_out | 8-bit | Output data |

---

## 📄 Verilog Implementation

### Memory Declaration

```verilog id="s6q4kn"
reg [7:0] mem [7:0];
```

### Write Logic

```verilog id="vq8f4w"
if(wrenb == 1'b1)
begin
    mem[write_address] <= data_in;
end
```

### Read Logic

```verilog id="m3r1ox"
else
begin
    data_out <= mem[read_address];
end
```

### Reset Logic

```verilog id="n5s0fi"
if(!arst)
begin
    data_out <= 8'b00000000;
    ...
end
```

---

## 📁 Project Structure

```text id="6zxyvn"
Block-RAM-8x8/
│
├── src/
│   └── block_ram.v
│
├── testbench/
│   └── block_ram_tb.v
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

The BRAM was verified using a dedicated behavioral testbench.

### Clock Generation

```verilog id="z0x6oi"
always #5 clk_tb = ~clk_tb;
```

### Reset Sequence

```verilog id="n0dt2r"
arst_tb = 0;
#15;
arst_tb = 1;
```

The reset clears all memory locations before normal operation begins.

---

### Write Test

The following values were written into memory:

| Address | Data |
| ------- | ---- |
| 0       | 0A   |
| 1       | 0B   |
| 2       | 0C   |
| 3       | 0D   |
| 4       | 0E   |
| 5       | 0F   |
| 6       | 10   |
| 7       | 11   |

Write operation:

```verilog id="d6fkrm"
write_address_tb = i;
data_in_tb = i + 10;
```

---

### Read Test

The memory locations were then read sequentially.

| Address | Expected Output |
| ------- | --------------- |
| 0       | 0A              |
| 1       | 0B              |
| 2       | 0C              |
| 3       | 0D              |
| 4       | 0E              |
| 5       | 0F              |
| 6       | 10              |
| 7       | 11              |

---

## 📊 Simulation Results

Behavioral simulation was performed using Xilinx Vivado.

### Waveform Analysis

The waveform confirms:

* Successful reset operation.
* Correct write operations at all memory locations.
* Proper address decoding.
* Successful data retrieval.
* Data integrity maintained throughout execution.

### Observed Memory Contents

| Address | Stored Data |
| ------- | ----------- |
| 000     | 0A          |
| 001     | 0B          |
| 010     | 0C          |
| 011     | 0D          |
| 100     | 0E          |
| 101     | 0F          |
| 110     | 10          |
| 111     | 11          |

### Verification Summary

| Feature          | Status |
| ---------------- | ------ |
| Memory Write     | PASS   |
| Memory Read      | PASS   |
| Address Decoding | PASS   |
| Reset Operation  | PASS   |
| Data Integrity   | PASS   |

---

## 📷 RTL Schematic

Add RTL schematic screenshot here.

```markdown
![RTL Schematic](screenshots/rtl_schematic.png)
```

---

## 📈 Simulation Waveform

<img width="1062" height="516" alt="my block" src="https://github.com/user-attachments/assets/59fbc527-09d0-4768-a4bf-2009762f22c7" />


## 🚀 How to Run

1. Open Xilinx Vivado.
2. Create a new RTL Project.
3. Add `block_ram.v`.
4. Add `block_ram_tb.v`.
5. Run Behavioral Simulation.
6. Verify memory write and read operations.

---

## 🎯 Applications

* FIFO Design
* Memory Buffers
* Data Storage Systems
* Embedded Controllers
* FPGA-Based Processors
* Communication Systems
* Cache Memory Prototypes

---

## 🔮 Future Enhancements

* Dual-Port Block RAM
* Parameterized Memory Depth
* Wider Data Bus Support
* Byte-Enable Support
* Memory Initialization Files
* True FPGA BRAM Inference

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

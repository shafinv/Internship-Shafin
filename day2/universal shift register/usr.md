# Universal Shift Register (USR) Using Verilog HDL

A Verilog HDL implementation of a **4-Bit Universal Shift Register (USR)** capable of performing serial shifting and parallel loading operations under different operating modes. The design supports reset, serial input, parallel input, shift control, and load control.

---

## 📖 Overview

A Universal Shift Register is a versatile sequential circuit capable of performing multiple data transfer operations within a single register.

This project implements a 4-bit Universal Shift Register with:

* Serial data input
* Parallel data input
* Serial data output
* Parallel data output
* Shift operation
* Parallel load operation
* Synchronous reset

The design is implemented in Verilog HDL and verified through behavioral simulation in Xilinx Vivado.

---

## ✨ Features

* 4-bit data storage
* Synchronous reset
* Serial data shifting
* Parallel data loading
* Serial output support
* Parallel output support
* Mode-controlled operation
* Synthesizable Verilog HDL design

---

## 🧠 Theory

A Universal Shift Register combines the functionality of different shift register types into a single circuit.

### Supported Operations

| Mode | Operation             |
| ---- | --------------------- |
| 00   | Serial Shift          |
| 01   | Serial Shift          |
| 10   | Parallel Load / Shift |
| 11   | Parallel Load         |

The register contents are stored in an internal 4-bit register called `temp`.

---

## 🏗️ Design Architecture

```text
                  +----------------------+
      Serial In -->|                      |
                   |                      |
 Parallel In[3:0]->| Universal Shift Reg. |--> Parallel Out[3:0]
                   |                      |
          Clock -->|                      |--> Serial Out
          Reset -->|                      |
                   +----------------------+
```

---

## 📋 Mode Description

### Mode 00 – Serial Shift

When `shift = 1`:

```text
temp <= {sin, temp[3:1]}
```

The serial input bit is inserted into the MSB position and the register contents shift right.

---

### Mode 01 – Serial Shift

Operation identical to Mode 00.

When `shift = 1`:

```text
temp <= {sin, temp[3:1]}
```

---

### Mode 10 – Parallel Load / Shift

#### Parallel Load

When:

```text
load = 1
```

```text
temp <= pin
```

#### Shift Operation

When:

```text
load = 0
shift = 1
```

```text
temp <= {1'b0,temp[3:1]}
```

A logic 0 is shifted into the MSB position.

---

### Mode 11 – Parallel Load

When:

```text
load = 1
```

```text
temp <= pin
```

The complete 4-bit parallel input is loaded into the register.

---

## 📂 Inputs and Outputs

### Inputs

| Signal | Width | Description          |
| ------ | ----- | -------------------- |
| clk    | 1-bit | Clock signal         |
| rst    | 1-bit | Synchronous reset    |
| sin    | 1-bit | Serial input         |
| pin    | 4-bit | Parallel input       |
| shift  | 1-bit | Shift enable         |
| load   | 1-bit | Parallel load enable |
| mode   | 2-bit | Mode selection       |

### Outputs

| Signal | Width | Description     |
| ------ | ----- | --------------- |
| sout   | 1-bit | Serial output   |
| pout   | 4-bit | Parallel output |

---

## 📄 Verilog Implementation

### Key Logic

```verilog
assign pout = temp;
assign sout = temp[0];
```

The least significant bit is used as the serial output.

### Reset Logic

```verilog
if(rst)
begin
    temp <= 4'b0000;
end
```

### Shift Logic

```verilog
temp <= {sin,temp[3:1]};
```

### Parallel Load Logic

```verilog
temp <= pin;
```

---

## 📁 Project Structure

```text
Universal-Shift-Register/
│
├── src/
│   └── usr.v
│
├── testbench/
│   └── usr_tb.v
│
├── screenshots/
│   ├── rtl_schematic.png
│   └── waveform.png
│
└── README.md
```

---

## 🧪 Testbench Verification

The register was tested using all supported modes.

### Test Sequence

#### Reset

```text
rst = 1
```

Register contents:

```text
0000
```

---

#### Mode 00 (Serial Shift)

Input sequence:

```text
1 → 0 → 1 → 1
```

Observed register values:

```text
1000
0100
1010
1101
```

---

#### Mode 01 (Serial Shift)

Input sequence:

```text
1 → 0 → 1 → 0
```

Register values continue shifting according to serial input.

---

#### Mode 10 (Parallel Load + Shift)

Parallel input loaded:

```text
1101
```

Then shifted right with:

```text
temp <= {1'b0,temp[3:1]}
```

Observed sequence:

```text
1101
0110
0011
0001
0000
```

---

#### Mode 11 (Parallel Load)

Parallel input loaded:

```text
1010
```

Output:

```text
1010
```

---

## 📊 Simulation Results

Behavioral simulation was performed using Xilinx Vivado.

### Waveform Analysis

The waveform verifies:

* Correct reset operation
* Successful serial shifting
* Correct parallel loading
* Proper serial output generation
* Correct mode selection operation

### Observed Register Values

| Time Interval | Mode  | Output (pout) |
| ------------- | ----- | ------------- |
| Reset         | --    | 0000          |
| Mode 00       | Shift | 1000          |
| Mode 00       | Shift | 0100          |
| Mode 00       | Shift | 1010          |
| Mode 00       | Shift | 1101          |
| Mode 10       | Load  | 1101          |
| Mode 10       | Shift | 0110          |
| Mode 10       | Shift | 0011          |
| Mode 10       | Shift | 0001          |
| Mode 11       | Load  | 1010          |

---

## 📈 Simulation Waveform

<img width="845" height="474" alt="usr" src="https://github.com/user-attachments/assets/239b0689-cb03-4381-ac00-6459fe25c1f8" />


## 🚀 How to Run

1. Open Xilinx Vivado.
2. Create a new RTL Project.
3. Add `usr.v`.
4. Add `usr_tb.v`.
5. Run Behavioral Simulation.
6. Observe the waveform.
7. Verify all operating modes.

---

## 🎯 Applications

* Serial Communication Systems
* Data Conversion Circuits
* Temporary Data Storage
* Digital Signal Processing
* FPGA-Based Designs
* Embedded Systems
* Microprocessor Interfaces

---

## 🔮 Future Enhancements

* Bidirectional Shifting
* Rotate Left/Rotate Right Operations
* Parameterized Register Width
* Asynchronous Reset Support
* Enable Control Signal

---

## 🛠️ Tools Used

* Verilog HDL
* Xilinx Vivado
* Behavioral Simulation

---

## 👨‍💻 Author

**Shafin V**

Department of Electronics and Communication Engineering

Government Engineering College Thrissur

---

## 📜 License

This project is intended for educational and academic purposes.

# BCD Adder Using Verilog HDL

A Verilog HDL implementation of a **1-Digit Binary Coded Decimal (BCD) Adder** using Ripple Carry Adders and BCD correction logic. The design performs decimal addition of two BCD digits along with an optional carry input and produces a valid BCD output.

---

## 📖 Overview

A BCD Adder is a combinational circuit used to add two decimal digits represented in Binary Coded Decimal (BCD) format.

Since a valid BCD digit ranges from **0000 (0)** to **1001 (9)**, any binary sum greater than 9 requires correction. This correction is performed by adding **0110 (decimal 6)** to the intermediate binary sum.

This project implements the BCD Adder using:

* Verilog HDL
* Ripple Carry Adders
* Correction Logic
* Behavioral Simulation in Xilinx Vivado

---

## ✨ Features

* 4-bit BCD addition
* Carry input support
* Automatic BCD correction
* Modular Verilog design
* Behavioral simulation verified
* Synthesizable RTL design

---

## 🧠 Theory

BCD (Binary Coded Decimal) represents decimal digits using four binary bits.

| Decimal | BCD  |
| ------- | ---- |
| 0       | 0000 |
| 1       | 0001 |
| 2       | 0010 |
| 3       | 0011 |
| 4       | 0100 |
| 5       | 0101 |
| 6       | 0110 |
| 7       | 0111 |
| 8       | 1000 |
| 9       | 1001 |

When two BCD digits are added:

* If the result is ≤ 9, the binary result is already valid.
* If the result is > 9, a correction value of **0110** must be added.

### Correction Condition

```verilog
k = temp_cout | (s1[3] & s1[2]) | (s1[3] & s1[1]);
```

If `k = 1`, the correction value `0110` is added to the intermediate sum.

---

## 🏗️ Design Architecture

### Stage 1: Binary Addition

The first Ripple Carry Adder computes:

```text
A + B + Cin
```

Outputs:

```text
Intermediate Sum (s1)
Carry (temp_cout)
```

### Stage 2: Correction Detection

The correction logic checks whether:

```text
Binary Sum > 9
OR
Carry Generated
```

If true:

```text
Correction = 0110
```

### Stage 3: BCD Correction

The second Ripple Carry Adder adds the correction value to obtain the final BCD result.

---

## 📂 Module Hierarchy

```text
BCD Adder
│
├── Ripple Carry Adder (RCA1)
│
├── Correction Logic
│
└── Ripple Carry Adder (RCA2)
```

---

## 🔌 Inputs and Outputs

### Inputs

| Signal | Width | Description      |
| ------ | ----- | ---------------- |
| a      | 4-bit | First BCD digit  |
| b      | 4-bit | Second BCD digit |
| cin    | 1-bit | Carry input      |

### Outputs

| Signal | Width | Description          |
| ------ | ----- | -------------------- |
| s      | 4-bit | BCD Sum              |
| cout   | 1-bit | Decimal Carry Output |

---

## 📁 Project Structure

```text
BCD-Adder-Verilog/
│
├── src/
│   ├── fulladder.v
│   ├── ripple_carry_adder.v
│   └── bcd_adder.v
│
├── testbench/
│   └── bcd_adder_tb.v
│
├── screenshots/
│   ├── rtl_schematic.png
│   └── waveform.png
│
└── README.md
```

---

## 🧪 Test Cases

| Test No | A | B | Cin | Sum | Cout |
| ------- | - | - | --- | --- | ---- |
| 1       | 3 | 4 | 0   | 7   | 0    |
| 2       | 5 | 4 | 0   | 9   | 0    |
| 3       | 6 | 7 | 0   | 3   | 1    |
| 4       | 9 | 9 | 1   | 9   | 1    |

---

## 📊 Simulation Results

### Test Case 1

```text
3 + 4 + 0 = 7
```

Output:

```text
Sum = 7
Carry = 0
```

### Test Case 2

```text
5 + 4 + 0 = 9
```

Output:

```text
Sum = 9
Carry = 0
```

### Test Case 3

```text
6 + 7 + 0 = 13
```

Output:

```text
Sum = 3
Carry = 1
```

BCD Representation:

```text
1 3
```

### Test Case 4

```text
9 + 9 + 1 = 19
```

Output:

```text
Sum = 9
Carry = 1
```

BCD Representation:

```text
1 9
```

---

## 📈 Simulation Waveform
<img width="849" height="475" alt="bcd" src="https://github.com/user-attachments/assets/0b7721ad-7740-44f3-bc48-480c12177d79" />


## 🚀 How to Run

1. Open Xilinx Vivado.
2. Create a new RTL Project.
3. Add all Verilog source files.
4. Add the testbench file.
5. Run Behavioral Simulation.
6. Observe the waveform.
7. Verify BCD correction functionality.

---

## 🎯 Applications

* Digital Calculators
* Decimal Arithmetic Units
* FPGA-Based Arithmetic Systems
* Embedded Systems
* Financial and Commercial Computing Systems

---

## 🔮 Future Enhancements

* Multi-Digit BCD Adder
* BCD Adder/Subtractor
* Seven Segment Display Interface
* FPGA Hardware Implementation
* Parameterized N-Digit BCD Adder

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


# BCD Adder Using SystemVerilog Interface (EDA Playground)

A SystemVerilog implementation of a **BCD (Binary-Coded Decimal) Adder** verified using a **SystemVerilog Interface-based Testbench** on **EDA Playground**. The design performs decimal addition by adding two BCD digits and automatically applying BCD correction whenever the binary sum exceeds 9.

---

## 📖 Overview

A BCD Adder is a combinational digital circuit that performs arithmetic addition on two Binary-Coded Decimal (BCD) digits. Since a valid BCD digit ranges only from **0000 (0)** to **1001 (9)**, any binary sum greater than 9 must be corrected by adding **0110 (decimal 6)**.

This project implements a BCD Adder using two **4-bit Ripple Carry Adders**. The first adder performs binary addition, while the second adder performs BCD correction whenever required.

The design is verified using a **SystemVerilog Interface-based Testbench** on **EDA Playground**.

---

## ✨ Features

* Single-digit BCD Addition
* Automatic BCD Correction
* Two Ripple Carry Adders
* Carry Output Generation
* SystemVerilog Interface-Based Verification
* EDA Playground Simulation
* Synthesizable Design

---

## 🧠 Theory

BCD (Binary-Coded Decimal) represents decimal digits using 4-bit binary numbers.

Valid BCD numbers are:

```text
0000 → 0
0001 → 1
0010 → 2
...
1001 → 9
```

When two BCD digits are added, the binary result may become greater than **1001 (9)**. In this case, the circuit adds **0110 (6)** to generate a valid BCD result.

### BCD Correction Condition

Correction is required when:

* Binary carry is generated.
* Binary sum is greater than 9.

The correction signal is generated using:

```verilog
k = temp_cout | (s1[3] & s1[2]) | (s1[3] & s1[1]);
```

---

## 🏗️ Architecture

```text
                  +----------------------+
 A -------------> |                      |
 B -------------> | Ripple Carry Adder 1 |
 CIN -----------> |                      |
                  +----------------------+
                            |
                            |
                       Binary Sum
                            |
                  Correction Logic
                            |
                            v
                  +----------------------+
                  | Ripple Carry Adder 2 |
                  +----------------------+
                            |
                            |
                    BCD Sum & Carry
```

---

## 📂 Inputs and Outputs

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
| cout   | 1-bit | Decimal carry output |

---

## 📄 Design Implementation

### First Binary Addition

```systemverilog
ripple_carry_adder RCA1(
    a,
    b,
    cin,
    s1,
    temp_cout
);
```

---

### BCD Correction Logic

```systemverilog
assign k = temp_cout |
           (s1[3] & s1[2]) |
           (s1[3] & s1[1]);
```

---

### Correction Value

```systemverilog
assign correction = {1'b0, k, k, 1'b0};
```

---

### Final BCD Addition

```systemverilog
ripple_carry_adder RCA2(
    s1,
    correction,
    1'b0,
    s,
    dummy_cout
);
```

---

## 📡 SystemVerilog Interface

A SystemVerilog interface groups all DUT signals into a single reusable interface, simplifying the verification environment.

### Interface Declaration

```systemverilog
interface bcd_if;

logic [3:0] a;
logic [3:0] b;
logic cin;

logic [3:0] s;
logic cout;

endinterface
```

### Advantages

* Reduces signal connections.
* Improves code readability.
* Simplifies verification.
* Encourages reusable testbenches.
* Makes DUT connections cleaner.

---

## 📁 Project Structure

```text
BCD-Adder-SystemVerilog/
│
├── design/
|   └── bcd_adder.sv
│
├── testbench/
│   └── bcd_tbifsv.sv
│
└── README.md
```

---

## 🧪 Testbench Verification

The BCD Adder was verified using an interface-based SystemVerilog testbench.

### Applied Test Cases

| Test | A | B | Cin | Expected Sum | Carry |
| ---- | - | - | --- | ------------ | ----- |
| 1    | 3 | 4 | 0   | 7            | 0     |
| 2    | 5 | 4 | 0   | 9            | 0     |
| 3    | 6 | 7 | 0   | 3            | 1     |
| 4    | 9 | 9 | 1   | 9            | 1     |

---

### Console Output Verification

The simulation log confirms:

```text
3 + 4 = 7
5 + 4 = 9
6 + 7 = 13 → BCD Output = 3 Carry = 1
9 + 9 + 1 = 19 → BCD Output = 9 Carry = 1
```

The observed outputs match the expected decimal arithmetic.

---

## 📊 Simulation Results

Behavioral simulation was performed using **EDA Playground**.

### Waveform Analysis

The waveform confirms that:

* Binary addition is performed correctly.
* BCD correction is automatically applied whenever the sum exceeds 9.
* Carry output is asserted for invalid BCD sums.
* Correct decimal results are produced for all test vectors.

### Simulation Summary

| A | B | Cin | BCD Sum | Carry | Status |
| - | - | --- | ------- | ----- | ------ |
| 3 | 4 | 0   | 7       | 0     | PASS   |
| 5 | 4 | 0   | 9       | 0     | PASS   |
| 6 | 7 | 0   | 3       | 1     | PASS   |
| 9 | 9 | 1   | 9       | 1     | PASS   |

---

## 📷 Console Output

<img width="520" height="85" alt="bcd_intfc_kernal" src="https://github.com/user-attachments/assets/3a51e2c8-8fcd-4a4f-9677-0e04896075a2" />


## 📈 Simulation Waveform

<img width="1289" height="111" alt="bcd interface" src="https://github.com/user-attachments/assets/208d4581-febd-4f92-820a-5612448a4881" />



## 🚀 How to Run

1. Open **EDA Playground**.
2. Select **SystemVerilog** as the language.
3. Add the following files:
* `bcd_adder.sv`
* `bcd_tbsv.sv`

1. Select a supported simulator.
2. Run the simulation.
3. Verify the console output and waveform.

---

## 🎯 Applications

* Digital Calculators
* Financial Computing Systems
* Seven-Segment Display Controllers
* Decimal Arithmetic Units
* Embedded Systems
* FPGA-Based Arithmetic Circuits

---

## 🔮 Future Enhancements

* Multi-Digit BCD Adder
* Parameterized BCD Arithmetic Unit
* BCD Adder/Subtractor
* Carry Look-Ahead BCD Adder
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

# Ripple Carry Adder Using Verilog HDL

A Verilog HDL implementation of a **4-Bit Ripple Carry Adder (RCA)** using Full Adders. The design performs binary addition of two 4-bit numbers along with a carry input and generates a 4-bit sum and carry output.

---

## 📖 Overview

A Ripple Carry Adder (RCA) is a combinational circuit used for binary addition. It consists of multiple Full Adders connected in cascade, where the carry output of one Full Adder becomes the carry input of the next stage.

The carry signal propagates through each stage sequentially, creating a "ripple" effect. Although simple and easy to implement, the propagation delay increases with the number of bits.

---

## ✨ Features

* 4-bit binary addition
* Carry input support
* Carry output generation
* Modular design using Full Adders
* Synthesizable Verilog HDL code
* Easy to scale for larger bit widths

---

## 🧠 Theory

A Full Adder adds three binary inputs:

* A
* B
* Carry In (Cin)

and produces:

* Sum
* Carry Out (Cout)

### Full Adder Equations

**Sum**

```text
Sum = A ⊕ B ⊕ Cin
```

**Carry**

```text
Cout = (A · B) + (Cin · (A ⊕ B))
```

---

## 🏗️ Design Architecture

The 4-bit Ripple Carry Adder is constructed using four Full Adders connected in series.

```text
         Cin
          │
          ▼
+------+ +------+ +------+ +------+
| FA0 |→| FA1 |→| FA2 |→| FA3 |
+------+ +------+ +------+ +------+
    │        │        │        │
    ▼        ▼        ▼        ▼
   S0       S1       S2       S3

                    Final Carry
```

Each stage performs one-bit addition and passes its carry to the next stage.

---

## 📂 Module Description

### Inputs

| Signal  | Width | Description         |
| ------- | ----- | ------------------- |
| a_rca   | 4-bit | First binary input  |
| b_rca   | 4-bit | Second binary input |
| cin_rca | 1-bit | Carry input         |

### Outputs

| Signal  | Width | Description        |
| ------- | ----- | ------------------ |
| sum_rca | 4-bit | Sum output         |
| cout    | 1-bit | Final carry output |

---

## 📄 Verilog Implementation

```verilog
module ripple_carry_adder(
    input [3:0] a_rca,
    input [3:0] b_rca,
    input cin_rca,
    output [3:0] sum_rca,
    output cout
);

wire w1,w2,w3;

fulladder FA1(a_rca[0],b_rca[0],cin_rca,sum_rca[0],w1);
fulladder FA2(a_rca[1],b_rca[1],w1,sum_rca[1],w2);
fulladder FA3(a_rca[2],b_rca[2],w2,sum_rca[2],w3);
fulladder FA4(a_rca[3],b_rca[3],w3,sum_rca[3],cout);

endmodule
```

---

## 📁 Project Structure

```text
Ripple-Carry-Adder/
│
├── src/
│   ├── fulladder.v
│   └── ripple_carry_adder.v
│
├── testbench/
│   └── ripple_carry_adder_tb.v
│
├── screenshots/
│   ├── rtl_schematic.png
│   └── waveform.png
│
└── README.md
```

---

## 🧪 Testbench Verification

The Ripple Carry Adder was verified using multiple input combinations.

### Test Cases

| Test No | A    | B    | Cin | Sum  | Cout |
| ------- | ---- | ---- | --- | ---- | ---- |
| 1       | 0000 | 0000 | 0   | 0000 | 0    |
| 2       | 0001 | 0000 | 0   | 0001 | 0    |
| 3       | 1111 | 1111 | 0   | 1110 | 1    |
| 4       | 1111 | 1111 | 1   | 1111 | 1    |

---

## 📊 Simulation Results

### Test Case 1

```text
0000 + 0000 + 0 = 0000
```

Output:

```text
Sum = 0000
Carry = 0
```

---

### Test Case 2

```text
0001 + 0000 + 0 = 0001
```

Output:

```text
Sum = 0001
Carry = 0
```

---

### Test Case 3

```text
1111 + 1111 + 0 = 11110
```

Output:

```text
Sum = 1110
Carry = 1
```

---

### Test Case 4

```text
1111 + 1111 + 1 = 11111
```

Output:

```text
Sum = 1111
Carry = 1
```

---

## 📷 RTL Schematic

Add your RTL schematic screenshot here.

```markdown
![RTL Schematic](screenshots/rtl_schematic.png)
```

---

## 📈 Simulation Waveform
<img width="847" height="472" alt="ripplecarry" src="https://github.com/user-attachments/assets/f58f921a-e7a4-4097-9f50-4a9fe9776d31" />

```

---

## 🚀 How to Run

1. Open Xilinx Vivado.
2. Create a new RTL Project.
3. Add `fulladder.v` and `ripple_carry_adder.v`.
4. Add `ripple_carry_adder_tb.v`.
5. Run Behavioral Simulation.
6. Observe the waveform and verify outputs.

---

## 🎯 Applications

* Arithmetic Logic Units (ALU)
* Microprocessors
* Digital Signal Processing Systems
* Embedded Systems
* FPGA-Based Digital Designs

---

## 🔮 Future Enhancements

* 8-Bit Ripple Carry Adder
* Carry Look-Ahead Adder
* Carry Save Adder
* Parameterized N-Bit Adder

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

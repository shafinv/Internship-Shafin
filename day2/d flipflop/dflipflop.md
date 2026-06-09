# D Flip-Flop Using Verilog HDL

A Verilog HDL implementation of a **Positive Edge Triggered D Flip-Flop with Synchronous Reset**. The design stores the input data on the rising edge of the clock and provides both normal and complemented outputs.

---

## 📖 Overview

A D Flip-Flop is a fundamental sequential circuit used to store one bit of information. It captures the value present at the data input (**D**) on the rising edge of the clock signal and holds that value until the next active clock edge.

This project implements a positive-edge-triggered D Flip-Flop with synchronous reset using Verilog HDL and verifies its operation through behavioral simulation in Xilinx Vivado.

---

## ✨ Features

* Positive-edge-triggered operation
* Synchronous active-high reset
* Complementary output (`Q̅`)
* Synthesizable Verilog HDL code
* FPGA implementation ready
* Verified through simulation

---

## 🧠 Theory

A D Flip-Flop stores the value of input **D** on the rising edge of the clock.

### Operation

* When **Reset = 1**, the flip-flop is reset.
* When **Reset = 0**, the value at input **D** is transferred to output **Q** on the next positive clock edge.
* **Q̅** always remains the complement of **Q**.

---

## 📋 Truth Table

| Clock Edge | Reset | D | Q(next)   | Q̅(next)  |
| ---------- | ----- | - | --------- | --------- |
| ↑          | 1     | X | 0         | 1         |
| ↑          | 0     | 0 | 0         | 1         |
| ↑          | 0     | 1 | 1         | 0         |
| No Edge    | X     | X | No Change | No Change |

---

## 🏗️ Design Architecture

```text
          +----------------+
 D ------>|                |
          |   D Flip-Flop  |-----> Q
CLK ----->|                |
          |                |-----> Q̅
RST ----->|                |
          +----------------+
```

---

## 📄 Verilog Implementation

```verilog
module dflipflop(
    input d,
    input rst,
    input clk,
    output reg q,
    output reg qbar
);

always @(posedge clk)
begin
    if(rst)
    begin
        q <= 1'b0;
        qbar <= 1'b1;
    end
    else
    begin
        q <= d;
        qbar <= ~d;
    end
end

endmodule
```

---

## 📁 Project Structure

```text
D-FlipFlop/
│
├── src/
│   └── dflipflop.v
│
├── testbench/
│   └── dflipflop_tb.v
│
├── screenshots/
│   ├── rtl_schematic.png
│   └── waveform.png
│
└── README.md
```

---

## 🧪 Testbench Verification

The functionality of the D Flip-Flop was verified using the following testbench sequence.

### Input Sequence

| Time (ns) | Reset | D |
| --------- | ----- | - |
| 0         | 1     | 0 |
| 10        | 0     | 0 |
| 20        | 0     | 1 |

Clock Generation:

```verilog
always #5 clk_tb = ~clk_tb;
```

Clock Period:

```text
10 ns
```

---

## 📊 Simulation Results

### Test Case 1: Reset Active

| Signal | Value |
| ------ | ----- |
| Reset  | 1     |
| Q      | 0     |
| Q̅     | 1     |

Result: Flip-Flop is successfully reset.

---

### Test Case 2: Data Input = 0

| Signal | Value |
| ------ | ----- |
| Reset  | 0     |
| D      | 0     |

At the next positive clock edge:

```text
Q = 0
Q̅ = 1
```

Result: Input data is stored correctly.

---

### Test Case 3: Data Input = 1

| Signal | Value |
| ------ | ----- |
| Reset  | 0     |
| D      | 1     |

At the next positive clock edge:

```text
Q = 1
Q̅ = 0
```

Result: Input data is stored correctly.

---

### Waveform Analysis

The simulation waveform confirms that:

* Reset forces the output to a known state.
* Output changes only on the positive edge of the clock.
* Input data is correctly captured and stored.
* Q̅ always remains the complement of Q.

---



## 📈 Simulation Waveform
<img width="842" height="467" alt="dfipflop" src="https://github.com/user-attachments/assets/4071390a-81f6-4a15-aefa-231024073427" />

## 🚀 How to Run

1. Open Xilinx Vivado.
2. Create a new RTL Project.
3. Add `dflipflop.v`.
4. Add `dflipflop_tb.v`.
5. Run Behavioral Simulation.
6. Verify the outputs from the waveform.

---

## 🎯 Applications

* Registers
* Counters
* Shift Registers
* Memory Elements
* Finite State Machines (FSM)
* Data Synchronization Circuits
* Pipeline Registers in Processors

---

## 🔮 Future Enhancements

* Asynchronous Reset D Flip-Flop
* Enable-Controlled D Flip-Flop
* Master-Slave D Flip-Flop
* Multi-Bit Register Design
* Parameterized Register Module

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

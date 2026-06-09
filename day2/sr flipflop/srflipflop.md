# SR Flip-Flop Using Verilog HDL

A Verilog HDL implementation of a **Positive Edge Triggered SR (Set-Reset) Flip-Flop with Synchronous Reset**. The circuit stores one bit of information and changes its state according to the Set (S) and Reset (R) inputs on the rising edge of the clock.

---

## 📖 Overview

The SR Flip-Flop is one of the fundamental sequential logic circuits used in digital electronics. It can store one bit of information and provides memory functionality.

This design implements:

* Positive-edge-triggered operation
* Synchronous active-high reset
* Set operation
* Reset operation
* Hold state
* Invalid state detection
* Complementary outputs (Q and Q̅)

---

## ✨ Features

* Positive-edge-triggered operation
* Synchronous reset
* Set and Reset functionality
* Memory (Hold) state
* Complementary outputs
* Synthesizable Verilog HDL code
* FPGA implementation ready

---

## 🧠 Theory

An SR Flip-Flop stores one bit of information and operates according to the values of S and R.

### Hold State

When:

```text
S = 0
R = 0
```

The previous state is retained.

---

### Reset State

When:

```text
S = 0
R = 1
```

Output becomes:

```text
Q = 0
Q̅ = 1
```

---

### Set State

When:

```text
S = 1
R = 0
```

Output becomes:

```text
Q = 1
Q̅ = 0
```

---

### Invalid State

When:

```text
S = 1
R = 1
```

Output becomes undefined:

```text
Q = X
Q̅ = X
```

This condition should be avoided in practical circuits.

---

## 📋 Truth Table

| Clock Edge | Reset | S | R | Q(next) | Q̅(next) |
| ---------- | ----- | - | - | ------- | -------- |
| ↑          | 1     | X | X | 0       | 1        |
| ↑          | 0     | 0 | 0 | Hold    | Hold     |
| ↑          | 0     | 0 | 1 | 0       | 1        |
| ↑          | 0     | 1 | 0 | 1       | 0        |
| ↑          | 0     | 1 | 1 | X       | X        |

---

## 🏗️ Design Architecture

```text
          +----------------+
 S ------>|                |
 R ------>| SR Flip-Flop   |-----> Q
CLK ----->|                |
RST ----->|                |-----> Q̅
          +----------------+
```

---

## 📂 Inputs and Outputs

### Inputs

| Signal | Width | Description       |
| ------ | ----- | ----------------- |
| s      | 1-bit | Set input         |
| r      | 1-bit | Reset input       |
| rst    | 1-bit | Synchronous reset |
| clk    | 1-bit | Clock input       |

### Outputs

| Signal | Width | Description       |
| ------ | ----- | ----------------- |
| q      | 1-bit | Main output       |
| qbar   | 1-bit | Complement output |

---

## 📄 Verilog Implementation

```verilog
module sr_flipflop(
    input s,
    input r,
    input rst,
    input clk,
    output reg q,
    output reg qbar
);

always @(posedge clk)
begin
    if(clk)
    begin
        if(rst)
        begin
            q <= 1'b0;
            qbar <= 1'b1;
        end
        else if(s==0 && r==0)
        begin
            q <= q;
            qbar <= qbar;
        end
        else if(s==0 && r==1)
        begin
            q <= 1'b0;
            qbar <= 1'b1;
        end
        else if(s==1 && r==0)
        begin
            q <= 1'b1;
            qbar <= 1'b0;
        end
        else if(s==1 && r==1)
        begin
            q <= 1'bx;
            qbar <= 1'bx;
        end
    end
end

endmodule
```

---

## 🧪 Testbench Verification

The SR Flip-Flop was tested using all possible operating conditions.

### Applied Test Cases

| Time (ns) | Reset | S | R | Operation     |
| --------- | ----- | - | - | ------------- |
| 0         | 1     | 0 | 0 | Reset         |
| 10        | 0     | 0 | 0 | Hold          |
| 20        | 0     | 0 | 1 | Reset State   |
| 30        | 0     | 1 | 0 | Set State     |
| 40        | 0     | 1 | 1 | Invalid State |

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

Behavioral simulation was performed in Xilinx Vivado.

### Case 1: Reset Active

Inputs:

```text
RST = 1
```

Output:

```text
Q = 0
Q̅ = 1
```

Result: Flip-Flop resets successfully.

---

### Case 2: Hold State

Inputs:

```text
S = 0
R = 0
```

Output:

```text
Q = Previous State
Q̅ = Previous State
```

Result: Stored value is retained.

---

### Case 3: Reset State

Inputs:

```text
S = 0
R = 1
```

Output:

```text
Q = 0
Q̅ = 1
```

Result: Flip-Flop enters reset state.

---

### Case 4: Set State

Inputs:

```text
S = 1
R = 0
```

Output:

```text
Q = 1
Q̅ = 0
```

Result: Flip-Flop enters set state.

---

### Case 5: Invalid State

Inputs:

```text
S = 1
R = 1
```

Output:

```text
Q = X
Q̅ = X
```

Result: Undefined state occurs.

---

### Waveform Analysis

The simulation waveform confirms:

* Correct reset operation.
* Proper hold functionality.
* Successful set and reset operations.
* Undefined output for the invalid SR condition.
* Output changes only on the positive edge of the clock.

### Simulation Summary

| S | R | Q    | Q̅   |
| - | - | ---- | ---- |
| 0 | 0 | Hold | Hold |
| 0 | 1 | 0    | 1    |
| 1 | 0 | 1    | 0    |
| 1 | 1 | X    | X    |

---

## 📈 Simulation Waveform
<img width="846" height="475" alt="sr" src="https://github.com/user-attachments/assets/e1c22a76-f20f-4dfc-a282-407ec7ab80a4" />


## 🚀 How to Run

1. Open Xilinx Vivado.
2. Create a new RTL Project.
3. Add `sr_flipflop.v`.
4. Add `srflipflop_tb.v`.
5. Run Behavioral Simulation.
6. Verify outputs from the waveform.

---

## 🎯 Applications

* Memory Elements
* Registers
* Counters
* Finite State Machines (FSM)
* Control Circuits
* Digital Storage Systems

---

## 🔮 Future Enhancements

* Asynchronous Reset SR Flip-Flop
* Enable-Controlled SR Flip-Flop
* Master-Slave SR Flip-Flop
* Parameterized Register Design

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

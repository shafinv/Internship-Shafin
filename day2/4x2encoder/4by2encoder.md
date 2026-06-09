# 4:2 Encoder Using Verilog HDL

A Verilog HDL implementation of a **4-to-2 Encoder**. The encoder converts one active input among four input lines into its corresponding 2-bit binary output.

---

## 📖 Overview

An Encoder is a combinational logic circuit that converts multiple input lines into a smaller number of output lines.

A 4:2 Encoder has:

* 4 input lines
* 2 output lines

The output represents the binary code corresponding to the active input. This design uses combinational logic implemented with an `if-else` structure.

---

## ✨ Features

* 4 input lines
* 2-bit binary output
* Combinational logic design
* Synthesizable Verilog HDL code
* Simple and efficient implementation
* FPGA implementation ready

---

## 🧠 Theory

A 4:2 Encoder converts one active input line into a 2-bit binary number.

### Truth Table

| D3 | D2 | D1 | D0 | Output (B1 B0) |
| -- | -- | -- | -- | -------------- |
| 0  | 0  | 0  | 1  | 00             |
| 0  | 0  | 1  | 0  | 01             |
| 0  | 1  | 0  | 0  | 10             |
| 1  | 0  | 0  | 0  | 11             |

**Note:** Only one input should be active at a time.

---

## 🏗️ Design Architecture

```text
           +-------------+
 D0 ------>|             |
 D1 ------>|             |
 D2 ------>| 4:2 Encoder |----> B[1]
 D3 ------>|             |----> B[0]
           +-------------+
```

---

## 📂 Inputs and Outputs

### Inputs

| Signal | Width | Description         |
| ------ | ----- | ------------------- |
| d      | 4-bit | Encoder input lines |

### Outputs

| Signal | Width | Description           |
| ------ | ----- | --------------------- |
| b      | 2-bit | Encoded binary output |

---

## 📄 Verilog Implementation

```verilog
module encoder4by2(
    input [3:0] d,
    output reg [1:0] b
);

always @(*)
begin
    if(d[0])
        b = 2'b00;
    else if(d[1])
        b = 2'b01;
    else if(d[2])
        b = 2'b10;
    else if(d[3])
        b = 2'b11;
    else
        b = 2'b00;
end

endmodule
```

---

## ⚙️ Working Principle

The encoder continuously monitors all four input lines.

* If `D0` is active, output becomes `00`.
* If `D1` is active, output becomes `01`.
* If `D2` is active, output becomes `10`.
* If `D3` is active, output becomes `11`.
* If no input is active, output defaults to `00`.

---

## 🧪 Testbench Verification

The encoder was verified by activating one input line at a time.

### Testbench Code

```verilog
module encoder4by2_tb;

reg [3:0] d_tb;
wire [1:0] b_tb;

encoder4by2 dut(d_tb,b_tb);

initial
begin
    d_tb = 4'b0001;
    #5;

    d_tb = 4'b0010;
    #5;

    d_tb = 4'b0100;
    #5;

    d_tb = 4'b1000;

    $monitor("the value of d_tb is %b the value of b_tb is %b",
              d_tb,b_tb);
end

endmodule
```

---

## 📊 Simulation Results

Behavioral simulation was performed in Xilinx Vivado.

### Applied Test Cases

| Time (ns) | Input (D3 D2 D1 D0) | Active Input | Output (B1 B0) |
| --------- | ------------------- | ------------ | -------------- |
| 0         | 0001                | D0           | 00             |
| 5         | 0010                | D1           | 01             |
| 10        | 0100                | D2           | 10             |
| 15        | 1000                | D3           | 11             |

---

### Result Analysis

#### Case 1

```text
D0 = 1
```

Output:

```text
B = 00
```

---

#### Case 2

```text
D1 = 1
```

Output:

```text
B = 01
```

---

#### Case 3

```text
D2 = 1
```

Output:

```text
B = 10
```

---

#### Case 4

```text
D3 = 1
```

Output:

```text
B = 11
```

---

### Waveform Analysis

The simulation waveform confirms that:

* Each input is encoded correctly.
* Output changes immediately when the input changes.
* The encoder behaves as a combinational circuit.
* All test cases produce the expected binary outputs.

### Simulation Summary

| Input | Output |
| ----- | ------ |
| 0001  | 00     |
| 0010  | 01     |
| 0100  | 10     |
| 1000  | 11     |

---

## 📈 Simulation Waveform

<img width="849" height="475" alt="encoder" src="https://github.com/user-attachments/assets/72ec6d69-44f9-4d6d-9abd-e9711d3fc3ae" />

```markdown
![Simulation Waveform](screenshots/waveform.png)
```

---

## 🚀 How to Run

1. Open Xilinx Vivado.
2. Create a new RTL Project.
3. Add `encoder4by2.v`.
4. Add `encoder4by2_tb.v`.
5. Run Behavioral Simulation.
6. Verify the output encoding in the waveform.

---

## 🎯 Applications

* Keyboard Encoding
* Interrupt Handling Systems
* Data Compression
* Digital Communication Systems
* Microprocessor Interfaces
* Address Encoding

---

## 🔮 Future Enhancements

* Priority Encoder
* 8:3 Encoder
* Enable-Controlled Encoder
* Parameterized Encoder Design

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

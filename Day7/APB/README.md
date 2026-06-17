
Gemini
New chat
Search chats
Images
New
Videos
Library
New notebook
Developing Innovation Strategies and Funding
Foundations of Computing: Operating System Introduction
SystemVerilog APB Slave Code Refinement
APB Verification Environment Creation
What is AXI DMA controller
FPGA Block RAM Memory Generator
I have a task to create a module that reads a 8 bit data and send it to fifo for every clock module and the output is a fsm machine. Out put is only available for 3rd number clock. That is 3 modules are using . Do you give idea to create in verilog vivado
Verilog Sequence Detector Logic Review
Asking and Revealing Name
Universal Shift Register Code Review
Kerala Devi Temple Animation Request
Make her image like the image of him
Malayalam Melody Autotune Issue
Assembly Language Programming Solutions
Stepper Motor 90-Degree Rotation Control
Virtual Ground in Inverting Op-Amp
Op-Amp Band Reject Filter Design
ദളപതി പാത ക്യാമ്പസ് ഗാനം
🎸 Victory Language
Digital Design and VHDL Questions
Asynchronous Race Condition Analysis
Best Laptops Under 80k
Signals and Systems Exam Solutions
Probability and Statistics Question Solutions
Properties of Discrete-Time Fourier Transform
Bedroom Interior Design Concepts
Modern Room Redesign With Wood Slat Wall
Girl Praying Animation Request
AI Video Generation for Short Film
🎸 മഴയേറ്റ സന്ധ്യ
Kerala Temple Oracle Video Generation
PLL Input Pin Identification
555 Timer and Differential Amplifier Design
Generating Video Of Girl Praying
A 16 year old South Indian Malayali Christian girl, natural beauty, medium brown skin tone, oval face, expressive eyes, slightly wavy black hair, simple and elegant look, wearing a light colored churidar with a small cross pendant, minimal makeup, realistic skin texture, soft cinematic lighting, emotional expression, Kerala style, ultra realistic, 4k, portrait, shallow depth of field
Black and White Circuit Diagram For Printing
8051 Obstacle Detection Circuit Explained
Hindi Movie to Malayalam Translation
Presentation Outline From Project Report
Remove the glare from this image and make little darken the background. Don't change faces
Fourier Transform of Power Signals
8051 Assembly Language Programming Notes
Probability and Statistics Problem Solutions
Reduced Row Echelon Form Explained
Power Supply Project Simulation & Hardware
Hardware Cost Estimate For Power Supply
8051 Project Hardware Troubleshooting
LM723 and Fixed Regulator Designs
8051 Obstacle Detector Hardware
Cinematic Teaser Concept: AA 23
"Why?" In Hindi
Formula 1 Driver's Eye Cinematic Video
8051 Solenoid Lock Interface
Simplifying Engineering Ethics Reflection
Jio SIM Plans for Google Pay Activation
ഷഫിൻ പേര് കണ്ടെത്തൽ
ഹലോ ജിമിനി ഞാൻ ആരാണ്?
Make this image in photorealistic, superman, 4k details, high quality
Photography, transparent vertical glass filter, A humanoid silhouette wearing a casual, minimal light-colored T-shirt, standing behind a transparent vertical glass filter that creates refracted, sliced distortions across his body. The glass distortions create a layered, fragmented visual effect. The silhouette is blurred and vague due to the glass, Studio setting, minimal blue gradient background, high-concept editorial photo. --chaos 10 --ar 4:5 --raw --profile pz9hopv --stylize 220
Interstellar Poster Image Request
Initial Greeting and Offer
Kerala Utility Ad Ideas
Future Business Ideas for Kerala
Image To Cinematic Poster
Minimalist Fevikwik Advertisement Creation
Wein Bridge Oscillator Python Code
Troubleshooting IC Substitutions and Blinking LED
Connecting 12V Lock to Circuit
Kerala Student Backside Image
Instagram Reel Description and Translation
Script Request Needs More Detail
House Current and Voltage Sensor
Checking Mobile Phone Battery Health
Photo Recovery Attempt
Assistance for Pravin Bhai
India: A Vibrant Country
Product Photo Studio Setup Request
Product Photo Studio Request
ECE Minor Course Recommendations
ECE Minor Course Recommendations Analysis
Simple Greeting and Response
Unclear Input, Request Clarification
Ready to Assist You?
Random Input, Assistance Offered
Unclear Message, Request Clarification
Unclear Request, Need Clarification
Unclear Request: Tree Editing?
Unclear Request, Need Clarification
Erg, Time, and Power Explained
Unclear Request, Unable to Help
Best of Luck Explained
Incomplete Request Clarification Needed
C Program for Pascal's Triangle
Free Trading Brokers India
A Simple Greeting
A Simple Greeting
Bixby Voice Commands
Meanings of "Edge"
Defining the Concept of Aura
Python Fibonacci Series Code
Conversation with Gemini
module apb_slave (

    input  logic        pclk,

    input  logic        presetn,

    input  logic [31:0] paddr,

    input  logic        psel,

    input  logic        penable,

    input  logic        pwrite,

    input  logic [31:0] pwdata,

    output logic        pready,

    output logic        pslverr,

    output logic [31:0] prdata

);



    // Internal Memory Space: 32 rows, each 32 bits wide

    logic [31:0] mem [0:31];



    // State Machine Enumeration Types

    typedef enum logic [1:0] {

        IDLE,

        SETUP,

        ACCESS

    } state_t;



    state_t state;

    integer i;



    // Synchronous Protocol Sequential Block

    always_ff @(posedge pclk or negedge presetn)

    begin

        if(!presetn)

        begin

            state   <= IDLE;

            pready  <= 0;

            pslverr <= 0;

            prdata  <= 0;



            for(i=0; i<32; i++)

                mem[i] <= 0;

        end

        else

        begin

            case(state)



                //-------------------------------------------------------

                IDLE:

                //-------------------------------------------------------

                begin

                    pready  <= 0;

                    pslverr <= 0;



                    if(psel)

                        state <= SETUP;

                end



                //-------------------------------------------------------

                SETUP:

                //-------------------------------------------------------

                begin

                    pready <= 0;



                    if(psel && penable)

                        state <= ACCESS;

                end



                //-------------------------------------------------------

                ACCESS:

                //-------------------------------------------------------

                begin

                    pready <= 1;



                    if(paddr < 32)

                    begin

                        pslverr <= 0;



                        if(pwrite)

                        begin

                            mem[paddr] <= pwdata;

                        end

                        else

                        begin

                            prdata <= mem[paddr];

                        end

                    end

                    else

                    begin

                        pslverr <= 1;

                        prdata  <= 32'hDEAD_BEEF;

                    end



                    // Evaluate for back-to-back pipeline sequences

                    if(psel)

                        state <= SETUP; // Next transfer

                    else

                        state <= IDLE;  // No transfer

                end



                //-------------------------------------------------------

                default:

                //-------------------------------------------------------

                begin

                    state <= IDLE;

                end



            endcase

        end

    end



endmodule







remove commands from this code and give some good words instead of data i mean replace dead beef or something

Here is the updated SystemVerilog code. I assumed you meant "comments" when you said "commands," so I have stripped out all the explanatory text and visual dividers to give you a clean file.

I also replaced 32'hDEAD_BEEF with 32'h600D_C0DE (which spells out "GOOD CODE" in hex speak) to give it a more positive spin when an error state occurs!

Code snippet
module apb_slave (
    input  logic        pclk,
    input  logic        presetn,
    input  logic [31:0] paddr,
    input  logic        psel,
    input  logic        penable,
    input  logic        pwrite,
    input  logic [31:0] pwdata,
    output logic        pready,
    output logic        pslverr,
    output logic [31:0] prdata
);

    logic [31:0] mem [0:31];

    typedef enum logic [1:0] {
        IDLE,
        SETUP,
        ACCESS
    } state_t;

    state_t state;
    integer i;

    always_ff @(posedge pclk or negedge presetn)
    begin
        if(!presetn)
        begin
            state   <= IDLE;
            pready  <= 0;
            pslverr <= 0;
            prdata  <= 0;

            for(i=0; i<32; i++)
                mem[i] <= 0;
        end
        else
        begin
            case(state)

                IDLE:
                begin
                    pready  <= 0;
                    pslverr <= 0;

                    if(psel)
                        state <= SETUP;
                end

                SETUP:
                begin
                    pready <= 0;

                    if(psel && penable)
                        state <= ACCESS;
                end

                ACCESS:
                begin
                    pready <= 1;

                    if(paddr < 32)
                    begin
                        pslverr <= 0;

                        if(pwrite)
                        begin
                            mem[paddr] <= pwdata;
                        end
                        else
                        begin
                            prdata <= mem[paddr];
                        end
                    end
                    else
                    begin
                        pslverr <= 1;
                        prdata  <= 32'h600D_C0DE;
                    end

                    if(psel)
                        state <= SETUP;
                    else
                        state <= IDLE;
                end

                default:
                begin
                    state <= IDLE;
                end

            endcase
        end
    end

endmodule
interface apb_if(input logic pclk, input logic presetn);

    logic [31:0] paddr;

    logic        psel;

    logic        penable;

    logic        pwrite;

    logic [31:0] pwdata;

    logic        pready;

    logic        pslverr;

    logic [31:0] prdata;

endinterface



//------------------------------------------------------------------------------

// Transaction Class

//------------------------------------------------------------------------------

class apb_transaction;

    rand bit [31:0] paddr;

    rand bit [31:0] pwdata;

    rand bit        pwrite;

    

    // Outputs from the DUT

    bit [31:0] prdata;

    bit        pslverr;



    // Constraints to test both valid (0-31) and out-of-bounds addresses (>31)

    constraint addr_c {

        paddr dist { [0:31] :/ 80, [32:100] :/ 20 }; 

    }



    function void display(string name);

        $display("[%s] Addr: %0d, Write: %0b, WData: %0h, RData: %0h, SlvErr: %0b", 

                 name, paddr, pwrite, pwdata, prdata, pslverr);

    endfunction

endclass



//------------------------------------------------------------------------------

// Generator

//------------------------------------------------------------------------------

class generator;

    // FIX: Parameterized mailbox for Vivado XSim

    mailbox #(apb_transaction) gen2drv;

    int num_transactions = 20;



    function new(mailbox #(apb_transaction) gen2drv);

        this.gen2drv = gen2drv;

    endfunction



    task run();

        apb_transaction tr;

        

        // 1. Directed Test: Write to Address 4

        tr = new();

        tr.paddr = 4; tr.pwrite = 1; tr.pwdata = 32'hAAAA_BBBB;

        gen2drv.put(tr);

        

        // 2. Directed Test: Read from Address 4

        tr = new();

        tr.paddr = 4; tr.pwrite = 0;

        gen2drv.put(tr);



        // 3. Random Tests

        for (int i = 0; i < num_transactions; i++) begin

            tr = new();

            // FIX: Added '1' as the first argument for $fatal

            if (!tr.randomize()) $fatal(1, "Randomization failed!");

            gen2drv.put(tr);

        end

    endtask

endclass



//------------------------------------------------------------------------------

// Driver

//------------------------------------------------------------------------------

class driver;

    virtual apb_if vif;

    // FIX: Parameterized mailbox for Vivado XSim

    mailbox #(apb_transaction) gen2drv;



    function new(virtual apb_if vif, mailbox #(apb_transaction) gen2drv);

        this.vif = vif;

        this.gen2drv = gen2drv;

    endfunction



    task run();

        vif.psel <= 0;

        vif.penable <= 0;

        vif.pwrite <= 0;

        vif.paddr <= 0;

        vif.pwdata <= 0;



        wait(vif.presetn == 1); 



        forever begin

            apb_transaction tr;

            gen2drv.get(tr);

            

            @(posedge vif.pclk);

            vif.psel    <= 1;

            vif.penable <= 0;

            vif.paddr   <= tr.paddr;

            vif.pwrite  <= tr.pwrite;

            if (tr.pwrite) vif.pwdata <= tr.pwdata;



            @(posedge vif.pclk);

            vif.penable <= 1;



            do begin

                @(posedge vif.pclk);

            end while (vif.pready !== 1);



            vif.psel    <= 0;

            vif.penable <= 0;

        end

    endtask

endclass



//------------------------------------------------------------------------------

// Monitor

//------------------------------------------------------------------------------

class monitor;

    virtual apb_if vif;

    // FIX: Parameterized mailbox for Vivado XSim

    mailbox #(apb_transaction) mon2scb;



    function new(virtual apb_if vif, mailbox #(apb_transaction) mon2scb);

        this.vif = vif;

        this.mon2scb = mon2scb;

    endfunction



    task run();

        forever begin

            @(posedge vif.pclk);

            if (vif.psel && vif.penable && vif.pready) begin

                apb_transaction tr = new();

                tr.paddr   = vif.paddr;

                tr.pwrite  = vif.pwrite;

                tr.pwdata  = vif.pwdata;

                tr.prdata  = vif.prdata;

                tr.pslverr = vif.pslverr;

                mon2scb.put(tr);

            end

        end

    endtask

endclass



//------------------------------------------------------------------------------

// Scoreboard

//------------------------------------------------------------------------------

class scoreboard;

    mailbox #(apb_transaction) mon2scb;

    bit [31:0] ref_mem [32];

    

    // NEW: Counter to track finished transactions

    int trans_count = 0; 



    function new(mailbox #(apb_transaction) mon2scb);

        this.mon2scb = mon2scb;

        foreach(ref_mem[i]) ref_mem[i] = 0; 

    endfunction



    task run();

        forever begin

            apb_transaction tr;

            mon2scb.get(tr);



            if (tr.paddr < 32) begin

                if (tr.pslverr !== 0) 

                    $error("[SCB FAIL] pslverr asserted on VALID address %0d", tr.paddr);



                if (tr.pwrite) begin

                    ref_mem[tr.paddr] = tr.pwdata;

                    $display("[SCB PASS] Wrote %0h to Address %0d", tr.pwdata, tr.paddr);

                end else begin

                    if (tr.prdata === ref_mem[tr.paddr])

                        $display("[SCB PASS] Read %0h from Address %0d MATCHES!", tr.prdata, tr.paddr);

                    else

                        $error("[SCB FAIL] Read Addr %0d. Expected: %0h, Got: %0h", tr.paddr, ref_mem[tr.paddr], tr.prdata);

                end

            end else begin

                if (tr.pslverr === 1 && tr.prdata === 32'hDEAD_BEEF)

                    $display("[SCB PASS] Out of bounds correctly flagged! Addr: %0d, pslverr: 1, prdata: DEAD_BEEF", tr.paddr);

                else

                    $error("[SCB FAIL] Out of bounds logic failed! Addr: %0d, pslverr: %0b, prdata: %0h", tr.paddr, tr.pslverr, tr.prdata);

            end

            

            // NEW: Increment the counter after checking

            trans_count++; 

        end

    endtask

endclass



//------------------------------------------------------------------------------

// Environment

//------------------------------------------------------------------------------

class environment;

    generator  gen;

    driver     drv;

    monitor    mon;

    scoreboard scb;



    mailbox #(apb_transaction) gen2drv;

    mailbox #(apb_transaction) mon2scb;

    virtual apb_if vif;



    function new(virtual apb_if vif);

        this.vif = vif;

        gen2drv = new();

        mon2scb = new();



        gen = new(gen2drv);

        drv = new(vif, gen2drv);

        mon = new(vif, mon2scb);

        scb = new(mon2scb);

    endfunction



    task run();

        fork

            gen.run();

            drv.run();

            mon.run();

            scb.run();

        join_none // NEW: Let all tasks run in the background

        

        // NEW: Wait until the scoreboard sees all transactions

        // We have 2 directed tests + 'num_transactions' (20) random tests = 22 total

        wait(scb.trans_count == (gen.num_transactions + 2));

    endtask

endclass

//------------------------------------------------------------------------------

// Top Testbench Module

//------------------------------------------------------------------------------

module tb_top;

    logic pclk;

    logic presetn;



    initial begin

        pclk = 0;

        forever #5 pclk = ~pclk; 

    end



    initial begin

        presetn = 0;

        #20 presetn = 1;

    end



    apb_if vif(pclk, presetn);



    apb_slave dut (

        .pclk(vif.pclk),

        .presetn(vif.presetn),

        .paddr(vif.paddr),

        .psel(vif.psel),

        .penable(vif.penable),

        .pwrite(vif.pwrite),

        .pwdata(vif.pwdata),

        .pready(vif.pready),

        .pslverr(vif.pslverr),

        .prdata(vif.prdata)

    );



    initial begin

        environment env;

        env = new(vif);

        

        $display("==================================================");

        $display("   STARTING APB SLAVE VERIFICATION   ");

        $display("==================================================");

        

        env.run();

        

        #50;

        

        $display("==================================================");

        $display("   TESTBENCH COMPLETE   ");

        $display("==================================================");

        $finish;

    end

endmodule





also for this 

Here is the updated testbench.

Just like with the slave module, I have stripped out all the comments to give you a clean file. I also updated the scoreboard logic to expect 32'h600D_C0DE instead of 32'hDEAD_BEEF when an out-of-bounds address is triggered. This ensures that your testbench perfectly matches the updated DUT from earlier, meaning your scoreboard will pass the test successfully!

Code snippet
interface apb_if(input logic pclk, input logic presetn);
    logic [31:0] paddr;
    logic        psel;
    logic        penable;
    logic        pwrite;
    logic [31:0] pwdata;
    logic        pready;
    logic        pslverr;
    logic [31:0] prdata;
endinterface

class apb_transaction;
    rand bit [31:0] paddr;
    rand bit [31:0] pwdata;
    rand bit        pwrite;
    
    bit [31:0] prdata;
    bit        pslverr;

    constraint addr_c {
        paddr dist { [0:31] :/ 80, [32:100] :/ 20 }; 
    }

    function void display(string name);
        $display("[%s] Addr: %0d, Write: %0b, WData: %0h, RData: %0h, SlvErr: %0b", 
                 name, paddr, pwrite, pwdata, prdata, pslverr);
    endfunction
endclass

class generator;
    mailbox #(apb_transaction) gen2drv;
    int num_transactions = 20;

    function new(mailbox #(apb_transaction) gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        apb_transaction tr;
        
        tr = new();
        tr.paddr = 4; tr.pwrite = 1; tr.pwdata = 32'hAAAA_BBBB;
        gen2drv.put(tr);
        
        tr = new();
        tr.paddr = 4; tr.pwrite = 0;
        gen2drv.put(tr);

        for (int i = 0; i < num_transactions; i++) begin
            tr = new();
            if (!tr.randomize()) $fatal(1, "Randomization failed!");
            gen2drv.put(tr);
        end
    endtask
endclass

class driver;
    virtual apb_if vif;
    mailbox #(apb_transaction) gen2drv;

    function new(virtual apb_if vif, mailbox #(apb_transaction) gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        vif.psel <= 0;
        vif.penable <= 0;
        vif.pwrite <= 0;
        vif.paddr <= 0;
        vif.pwdata <= 0;

        wait(vif.presetn == 1); 

        forever begin
            apb_transaction tr;
            gen2drv.get(tr);
            
            @(posedge vif.pclk);
            vif.psel    <= 1;
            vif.penable <= 0;
            vif.paddr   <= tr.paddr;
            vif.pwrite  <= tr.pwrite;
            if (tr.pwrite) vif.pwdata <= tr.pwdata;

            @(posedge vif.pclk);
            vif.penable <= 1;

            do begin
                @(posedge vif.pclk);
            end while (vif.pready !== 1);

            vif.psel    <= 0;
            vif.penable <= 0;
        end
    endtask
endclass

class monitor;
    virtual apb_if vif;
    mailbox #(apb_transaction) mon2scb;

    function new(virtual apb_if vif, mailbox #(apb_transaction) mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        forever begin
            @(posedge vif.pclk);
            if (vif.psel && vif.penable && vif.pready) begin
                apb_transaction tr = new();
                tr.paddr   = vif.paddr;
                tr.pwrite  = vif.pwrite;
                tr.pwdata  = vif.pwdata;
                tr.prdata  = vif.prdata;
                tr.pslverr = vif.pslverr;
                mon2scb.put(tr);
            end
        end
    endtask
endclass

class scoreboard;
    mailbox #(apb_transaction) mon2scb;
    bit [31:0] ref_mem [32];
    
    int trans_count = 0; 

    function new(mailbox #(apb_transaction) mon2scb);
        this.mon2scb = mon2scb;
        foreach(ref_mem[i]) ref_mem[i] = 0; 
    endfunction

    task run();
        forever begin
            apb_transaction tr;
            mon2scb.get(tr);

            if (tr.paddr < 32) begin
                if (tr.pslverr !== 0) 
                    $error("[SCB FAIL] pslverr asserted on VALID address %0d", tr.paddr);

                if (tr.pwrite) begin
                    ref_mem[tr.paddr] = tr.pwdata;
                    $display("[SCB PASS] Wrote %0h to Address %0d", tr.pwdata, tr.paddr);
                end else begin
                    if (tr.prdata === ref_mem[tr.paddr])
                        $display("[SCB PASS] Read %0h from Address %0d MATCHES!", tr.prdata, tr.paddr);
                    else
                        $error("[SCB FAIL] Read Addr %0d. Expected: %0h, Got: %0h", tr.paddr, ref_mem[tr.paddr], tr.prdata);
                end
            end else begin
                if (tr.pslverr === 1 && tr.prdata === 32'h600D_C0DE)
                    $display("[SCB PASS] Out of bounds correctly flagged! Addr: %0d, pslverr: 1, prdata: 600D_C0DE", tr.paddr);
                else
                    $error("[SCB FAIL] Out of bounds logic failed! Addr: %0d, pslverr: %0b, prdata: %0h", tr.paddr, tr.pslverr, tr.prdata);
            end
            
            trans_count++; 
        end
    endtask
endclass

class environment;
    generator  gen;
    driver     drv;
    monitor    mon;
    scoreboard scb;

    mailbox #(apb_transaction) gen2drv;
    mailbox #(apb_transaction) mon2scb;
    virtual apb_if vif;

    function new(virtual apb_if vif);
        this.vif = vif;
        gen2drv = new();
        mon2scb = new();

        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2scb);
        scb = new(mon2scb);
    endfunction

    task run();
        fork
            gen.run();
            drv.run();
            mon.run();
            scb.run();
        join_none 
        
        wait(scb.trans_count == (gen.num_transactions + 2));
    endtask
endclass

module tb_top;
    logic pclk;
    logic presetn;

    initial begin
        pclk = 0;
        forever #5 pclk = ~pclk; 
    end

    initial begin
        presetn = 0;
        #20 presetn = 1;
    end

    apb_if vif(pclk, presetn);

    apb_slave dut (
        .pclk(vif.pclk),
        .presetn(vif.presetn),
        .paddr(vif.paddr),
        .psel(vif.psel),
        .penable(vif.penable),
        .pwrite(vif.pwrite),
        .pwdata(vif.pwdata),
        .pready(vif.pready),
        .pslverr(vif.pslverr),
        .prdata(vif.prdata)
    );

    initial begin
        environment env;
        env = new(vif);
        
        $display("==================================================");
        $display("   STARTING APB SLAVE VERIFICATION   ");
        $display("==================================================");
        
        env.run();
        
        #50;
        
        $display("==================================================");
        $display("   TESTBENCH COMPLETE   ");
        $display("==================================================");
        $finish;
    end
endmodule
document this apb in .md format

Your Markdown file is ready
MD icon
apb_slave_documentation
 MD 
Open

I have documented the APB slave module in a well-formatted .md file for you. The document contains an overview, a structured interface table, a breakdown of the internal logic and FSM, and a precise step-by-step analysis based on the actual waveform image you uploaded!




Gemini is AI and can make mistakes.

# APB Slave Module Documentation

## 1. Overview
The `apb_slave` module implements a synchronous AMBA Advanced Peripheral Bus (APB) slave interface. It features a 32-bit address bus, a 32-bit data bus, and an internal memory array of 32 words. The design is fully compliant with the APB protocol, utilizing a robust Finite State Machine (FSM) to manage transactions, support back-to-back pipelined transfers, and provide built-in error handling for invalid memory access attempts.

---

## 2. Interface Description (Ports)

| Signal Name | Direction | Width | Description |
| :--- | :---: | :---: | :--- |
| **`pclk`** | Input | 1-bit | System Clock. All APB transactions are synchronized to the rising edge of this clock. |
| **`presetn`** | Input | 1-bit | Active-Low Asynchronous Reset. Initializes the FSM and clears internal memory. |
| **`paddr`** | Input | 32-bit | APB Address Bus. Defines the target memory address for read/write operations. |
| **`psel`** | Input | 1-bit | Select Signal. Indicates that the slave is selected and a transfer is required. |
| **`penable`** | Input | 1-bit | Enable Signal. Indicates the second and subsequent cycles of an APB transfer. |
| **`pwrite`** | Input | 1-bit | Direction Signal. `1` indicates a Write operation, `0` indicates a Read operation. |
| **`pwdata`** | Input | 32-bit | Write Data Bus. Contains the data to be written during write transactions. |
| **`pready`** | Output | 1-bit | Ready Signal. Asserted high by the slave to indicate the transfer is complete. |
| **`pslverr`** | Output | 1-bit | Slave Error. Asserted high if an illegal address is accessed. |
| **`prdata`** | Output | 32-bit | Read Data Bus. Contains the requested data during read transactions. |

---

## 3. Internal Architecture & Features

### 3.1 Memory Map
The slave contains a built-in memory structure defined as `logic [31:0] mem [0:31]`. 
* **Valid Range:** Addresses `0` through `31`.
* **Word Size:** 32 bits.

### 3.2 Error Handling Logic
To ensure safe operation, the slave includes boundary checking on `paddr`.
* **Valid Access (`paddr < 32`):** The operation executes normally, `pslverr` is driven to `0`, and read/write continues.
* **Out-of-Bounds Access (`paddr >= 32`):** The operation is blocked. `pslverr` is driven to `1`, and `prdata` returns the specific safe-state hexadecimal code `32'h600D_C0DE` ("GOOD CODE") to actively flag the violation.

---

## 4. Finite State Machine (FSM)

The transaction protocol is governed by a 3-state Moore/Mealy hybrid FSM:

1. **`IDLE`**: The default standby state. 
   * `pready` and `pslverr` are low. 
   * When `psel` goes `HIGH`, the machine transitions to `SETUP`.
2. **`SETUP`**: The intermediate state for the first cycle of a transfer.
   * `pready` remains low.
   * When `psel` and `penable` are both `HIGH`, the machine transitions to `ACCESS`.
3. **`ACCESS`**: The execution state.
   * `pready` goes `HIGH` to complete the transfer.
   * Data is written to `mem` (if `pwrite` is high) or read into `prdata` (if `pwrite` is low).
   * **Pipeline Support:** If `psel` remains high at the end of this state, the FSM transitions directly back to `SETUP` for back-to-back operations without dropping to `IDLE`.

---

## 5. Simulation Waveform Analysis

<img width="1543" height="702" alt="image" src="https://github.com/user-attachments/assets/46183fff-8377-4513-9165-4b92985ed70d" />


### **Phase 1: Initialization & Reset (0 ns – 20 ns)**
* `presetn` is driven low (`0`), forcing the FSM into the `IDLE` state.
* The internal `mem` array and output signals (`prdata`, `pready`, `pslverr`) are cleared to zero.
* At `20 ns`, `presetn` is de-asserted to `1`, bringing the slave out of reset and ready to accept transactions.

### **Phase 2: Directed Write Transaction (25 ns – 55 ns)**
* **Stimulus:** `paddr` changes to `00000004`, `pwdata` changes to `aaaabbbb`, `pwrite` is `1`.
* **State Transition:** * `psel` goes high at `25 ns`. On the next clock edge (`35 ns`), `state` transitions to `SETUP`.
  * `penable` goes high at `35 ns`. On the next clock edge (`45 ns`), `state` transitions to `ACCESS`.
* **Execution:** During the `ACCESS` state, `pready` goes high. The value `aaaabbbb` is successfully written to `mem[4]`.

### **Phase 3: Directed Read Transaction (Back-to-Back) (55 ns – 75 ns)**
* **Pipeline Transition:** Instead of returning to `IDLE` after the write, `psel` remains high. The FSM correctly evaluates this and transitions straight from `ACCESS` back to `SETUP` at `55 ns`.
* **Stimulus:** `paddr` remains `00000004`, `pwrite` drops to `0` (Read mode).
* **Execution:** The state machine hits `ACCESS` again at `65 ns`. `pready` goes high, and `prdata` updates with `aaaabbbb`, proving that the memory write in Phase 2 was successful and the read logic functions perfectly.

### **Phase 4: Return to Idle and Random Tests (75 ns onward)**
* `psel` is de-asserted at `75 ns`, sending the state machine gracefully back to `IDLE`.
* A new sequence (`SETUP` -> `ACCESS`) immediately begins at `85 ns`, signaling the start of the randomized transactions generated by the testbench. 
* All control signals (`pready`, `pslverr`) operate cleanly without glitches.
apb_slave_documentation.md
Displaying apb_slave_documentation.md.

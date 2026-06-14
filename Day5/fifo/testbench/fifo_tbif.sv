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

module fifo_tbsv(

    );
    fifo_if fif();
    fifo dut(fif.clk,fif.rst,fif.wrenb,fif.rdenb,fif.data_in,fif.data_out,fif.full,fif.empty
    );
    initial 
         begin
            fif.clk = 0;
         end
    always #5 fif.clk = ~fif.clk;
     initial begin

        {fif.rst,fif.wrenb,fif.rdenb,fif.data_in} = 0;

        fif.rst = 1;
        #10;
        fif.rst = 0;
        #10;

        fif.wrenb = 1;
        fif.data_in = 8'h01; #10;
        fif.data_in = 8'h02; #10;
        fif.data_in = 8'h03; #10;
        fif.data_in = 8'h04; #10;
        fif.data_in = 8'h05; #10;
        fif.data_in = 8'h06; #10;
        fif.data_in = 8'h07; #10;
        fif.wrenb = 0;

        #20;
        fif.rdenb = 1;
        #80;
        fif.rdenb = 0;
        #20;
        $finish;

    end
     initial begin
        $monitor("Time=%0t | rst=%b wr=%b rd=%b din=%h dout=%h full=%b empty=%b",$time,fif.rst,fif.wrenb,fif.rdenb,fif.data_in,fif.data_out,fif.full,fif.empty);
    end
  
    initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end
endmodule
  

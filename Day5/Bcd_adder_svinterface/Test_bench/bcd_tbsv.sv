interface bcd_if;

    logic [3:0]a;
    logic [3:0]b;
    logic cin;
    logic [3:0]s;
    logic cout;
endinterface

module bcd_tbsv(

    );
    bcd_if aif();
    bcd_adder dut(aif.a,aif.b,aif.cin,aif.s,aif.cout);
  
  
    initial
    begin
      {aif.a,aif.b,aif.cin}=0;
    end
  
    initial
    begin
      aif.a=4'd3;
      aif.b=4'd4;
      aif.cin=1'b0;
      #1;
      aif.a=4'd5;
      aif.b=4'd4;
      aif.cin=1'b0;
      #1;
      aif.a=4'd6;
      aif.b=4'd7;
      aif.cin=1'b0;
      #1;
      aif.a=4'd9;
      aif.b=4'd9;
      aif.cin=1'b1;
      #1;
    end
     initial begin
       $monitor("Time=%0t | a=%d b=%d cin=%b sum=%p cout=%b",$time,aif.a,aif.b,aif.cin,aif.s,aif.cout);
    end
  
    initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end
endmodule
  


    rand bit wrenb;
    rand bit rdenb;
    rand bit [7:0] data_in;

    bit [7:0] data_out;
    bit full;
    bit empty;

    constraint c1
    {
        !(wrenb && rdenb);
    }

    function void display(string tag);

        $display("WR_EN   = %0b", wrenb);
        $display("RD_EN   = %0b", rdenb);
        $display("DATA_IN = %0h", data_in);
        $display("DATA_OUT= %0h", data_out);
        $display("FULL    = %0b", full);
        $display("EMPTY   = %0b", empty);

    endfunction

endclass

module tb;

    transaction tr;

    initial begin
        tr = new();

      repeat(25) begin
            tr.randomize();
            tr.display("GEN");
        end

        $finish;
    end

endmodule

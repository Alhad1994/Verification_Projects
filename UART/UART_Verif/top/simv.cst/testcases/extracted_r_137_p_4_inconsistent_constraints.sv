class c_137_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_137_4;
    c_137_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxxx0x0z01x100x1z1100x1xz1x00zx1zxxzxzzzzzzxzzzzxzzxzxzxxzzxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_132_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_132_4;
    c_132_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z01zzzxz0001xx0x1x00zxzx1xzxx0z1zxxxxxxxzxxxxzxzxzzzxxxzzzzxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_169_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_169_4;
    c_169_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x11110111zxzxxx100xx1x10xx110z0xzxzxzzzzxxzxxxxzxxzzxzzxzzxxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_124_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_124_4;
    c_124_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1zzz0zzzz10zx11z10x1x0zx0x01z01xxxxxzxzxzzzxzzxzxzzxzzxzzxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_64_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_64_4;
    c_64_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xxx0x10111111zxz01zzx00zxz001xxxxxzzxzzzxzxzzzxzzzzzxxzxzzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_91_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_91_4;
    c_91_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0101x11zxx1x11xzzzx001x0z00z0x0xzzzxxzzzxzzzzxzxxzxzzzxxzzxxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

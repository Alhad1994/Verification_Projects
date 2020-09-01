class c_10_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_10_4;
    c_10_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1z0x00x0zz0x1x000zzxx0x0x0z010zzzxzzzzxxxxxzzxzzxzxzxzzxxzzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

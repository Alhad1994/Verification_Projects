class c_136_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_136_4;
    c_136_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzx10101000xxxxz001xxz0x0zzxz00xxzxxzzxzzxxzzzxzxzxzzzzzxzxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

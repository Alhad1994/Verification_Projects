class c_144_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_144_4;
    c_144_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzz11z1xz0z0zzzxz0x0x10z00z0xz00xzzxxzxxzzzzzzxxxzzxzzxxzxxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

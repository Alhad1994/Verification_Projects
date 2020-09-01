class c_61_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_61_4;
    c_61_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z0x0xx10z1x10xx0z00xxxxxzxz1xzzzzzzxzxzxxxzzxxxxxxzxzxzxzxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

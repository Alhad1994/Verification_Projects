class c_41_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_41_4;
    c_41_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xzz00010zxzxxx1z001xxz0z1z0x10xxzxxzxzzzxxxzzxzxzxzzzzzzxxxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

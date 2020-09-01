class c_186_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_186_4;
    c_186_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxx1zz1110z1111zxzz1z0z010100zx1xzzxxxzzxzzzzzxzxzzzxzzzxzzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

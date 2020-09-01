class c_176_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_176_4;
    c_176_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10xx10010xzz101zz011xx000x0xzzz1xxzxzxxxzzxxzzzzzxzzxzzxxxzxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

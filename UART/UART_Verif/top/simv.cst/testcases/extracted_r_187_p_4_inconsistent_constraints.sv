class c_187_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_187_4;
    c_187_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x1x0xx10x0z111z01zz11z1xzz1z101xxzxzzzzxxxxzxxxxxxzzzxzzxxzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

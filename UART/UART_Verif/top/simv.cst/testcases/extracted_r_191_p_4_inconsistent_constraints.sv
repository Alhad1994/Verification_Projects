class c_191_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_191_4;
    c_191_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01x0z1x1zxxzxzzzzxzzxxzxz1z0111xxzxxxxzxxzxzxxxxxzzzxxzzxzzxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

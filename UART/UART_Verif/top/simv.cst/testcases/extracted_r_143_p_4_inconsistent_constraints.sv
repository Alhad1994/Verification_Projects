class c_143_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_143_4;
    c_143_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10001x101z101xxz0xxzz1xx0zx11111xxzzzxxzxzzzzzxxzzzxxxzxxzxzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

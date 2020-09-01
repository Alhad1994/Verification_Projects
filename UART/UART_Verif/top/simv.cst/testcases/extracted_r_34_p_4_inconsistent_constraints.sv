class c_34_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_34_4;
    c_34_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxxzz0zz11zxz0xxzzzz1zx1z00zx11xzxxzzzxxzzxxxzzxzxxxzxzzxzzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

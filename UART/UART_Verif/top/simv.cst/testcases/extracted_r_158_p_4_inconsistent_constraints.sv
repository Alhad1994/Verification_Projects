class c_158_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_158_4;
    c_158_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1000z00z010x0001110x0xz10z1x1x1xzzxxxzzzxzxzzxzzzzxzzxzxxzxzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

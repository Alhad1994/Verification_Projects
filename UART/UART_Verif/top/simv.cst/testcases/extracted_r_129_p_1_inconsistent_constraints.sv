class c_129_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_129_1;
    c_129_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xxzxx000xx11xxzz11xx1z0z1x010xxxxxxxxxzzxzxzxzxzxxzzzxxzxxzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

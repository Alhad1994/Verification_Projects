class c_50_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_50_1;
    c_50_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz10zx0011110x1x1x101xz1x001xz0xzxzxzzxzzxxzxzzxxxzxxzzxzzxxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

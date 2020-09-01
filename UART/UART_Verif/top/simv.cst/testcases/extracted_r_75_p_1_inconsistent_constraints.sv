class c_75_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_75_1;
    c_75_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z10zx0001xzzzxxz110z1z0z0010zzzzxzxxxzzxzzzxzzzzxxxzxzxzxxxxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

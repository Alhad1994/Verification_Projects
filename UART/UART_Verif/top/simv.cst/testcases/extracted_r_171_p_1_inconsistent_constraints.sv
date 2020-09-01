class c_171_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_171_1;
    c_171_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzzx1xz11x00x000xxx1zz0xxz000zz1xzxxzzzzzxxzxxzxxxzxxxxzxxxzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

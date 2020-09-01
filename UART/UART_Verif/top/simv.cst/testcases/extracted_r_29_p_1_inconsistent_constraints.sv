class c_29_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_29_1;
    c_29_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0zz100xxx01x10zz00z11zz010x001zzxzzzzzzzxzxzxxzxxzzxxxxzzzzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

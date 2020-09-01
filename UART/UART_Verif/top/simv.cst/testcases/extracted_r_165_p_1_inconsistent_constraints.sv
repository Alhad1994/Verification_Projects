class c_165_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_165_1;
    c_165_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx011z0x0zxx1zxxz010x1111zz1xx1xzxxzxxzxxxxxzxxzzzxzxzxxzzxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_71_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_71_1;
    c_71_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x01xzzzx0z1zz0z0z1z010x1x0111xzxzzzzzxxzxzzzxxzzxxxzxxzxxzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

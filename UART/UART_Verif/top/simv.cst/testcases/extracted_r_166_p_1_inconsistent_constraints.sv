class c_166_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_166_1;
    c_166_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1z0z11z001z01x1xz1z1xxxxx0zz1zzxxxzzxxzzxzxxzxzxxzxzxxxxzxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_141_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_141_1;
    c_141_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z11xx11z1zz0010x000zzxx0zz100z1xzzzxzxzzzxzxzxzxzxxzzzzxzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

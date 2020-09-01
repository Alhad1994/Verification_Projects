class c_34_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_34_1;
    c_34_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z11zz01xx1xx1x10zzz01zx100xzz0x0xzzxxzxzxxzzxxzzzzxzzxzzzzxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

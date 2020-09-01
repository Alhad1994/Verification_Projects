class c_73_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_73_1;
    c_73_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz1x1xzxz0xz001zz1xzz10zx1x0xx1xzzxxxzxzzzzxzxzzxzxxxxzzzxzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

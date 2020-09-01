class c_26_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_26_1;
    c_26_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xx1zxxx1x11zz0z0x1x0010zz01x10zxzxxxxzzzzzzzxxxxxzzzzxzzxzxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

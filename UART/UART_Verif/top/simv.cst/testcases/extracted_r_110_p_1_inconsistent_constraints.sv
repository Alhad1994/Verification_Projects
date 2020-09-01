class c_110_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_110_1;
    c_110_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x010zxz0111z010zx00x1x0x00x11x0xxzxxxxzzxzzxxzzzzzxzxxzzzxxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

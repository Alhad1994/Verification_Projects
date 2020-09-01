class c_55_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_55_1;
    c_55_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x11xxzx000110zx00z10x11zz1xzz0x1zxzzzzxzzxzxxxxxxzxxxzzxzxxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

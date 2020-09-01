class c_133_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_133_1;
    c_133_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z11x0x1x11zz10zx0011z110101zz0x1xzzxzzxzxzzzxzzzzzxxxzzxxxzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

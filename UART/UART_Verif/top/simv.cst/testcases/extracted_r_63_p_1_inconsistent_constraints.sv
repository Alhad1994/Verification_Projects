class c_63_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_63_1;
    c_63_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz000zzzz0110x10z01x10z0x10x00x0zzzxzxzzxxxxxxzxzzxxxzxxxzxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

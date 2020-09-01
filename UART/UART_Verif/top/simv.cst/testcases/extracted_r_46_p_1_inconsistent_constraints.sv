class c_46_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_46_1;
    c_46_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z0zz1z1x00zxxz11zzzx0xx010110x1xzzxzxxxzxzxzxzzzzzzxxzzxxzxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_40_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_40_1;
    c_40_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0z1x10z1x010x11zz1zxxz00x01xzx0xxzzzxzxzxxzxzzxzxzzzzzxxxzzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

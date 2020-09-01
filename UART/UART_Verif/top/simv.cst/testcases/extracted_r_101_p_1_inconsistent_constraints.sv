class c_101_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_101_1;
    c_101_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz00x11xxzzz0z1zxxz1zz10zz0x10x1zxxzxzxzzxzxxxxxzxzxxzzxxzzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_95_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_95_1;
    c_95_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzzx0x00xzzzx0z0101x1z0xxz0xz01xxxxzxzxzxxxzzzxzxzxxxxxxzxxzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

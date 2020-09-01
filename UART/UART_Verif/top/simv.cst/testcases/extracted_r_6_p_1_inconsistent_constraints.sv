class c_6_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_6_1;
    c_6_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x0z1zx001xz11xxz101zz01zzxz0zzzxxzxxxzzxzxzzxxxzxzxzzxzxxxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

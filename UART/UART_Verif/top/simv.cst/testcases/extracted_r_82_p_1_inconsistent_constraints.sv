class c_82_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_82_1;
    c_82_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzxx0x1z1xzxz0xxz10z000zz0x10xz1zzxzzzxxzzzzzxxxxxzzxxxzxzxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

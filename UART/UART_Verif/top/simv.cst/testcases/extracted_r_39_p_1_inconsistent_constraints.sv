class c_39_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_39_1;
    c_39_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzxzz10z0z00zz0z10zzzz1z1zz1zz00xxxxxxzxxxxzzxxzxxxxzzxxxzxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

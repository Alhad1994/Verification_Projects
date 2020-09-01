class c_12_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_12_1;
    c_12_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x1x0z01zzxxx1xz1xxz10xz1111z001zzxzzzxzxxxxxzxzxxzzzxxxzxzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

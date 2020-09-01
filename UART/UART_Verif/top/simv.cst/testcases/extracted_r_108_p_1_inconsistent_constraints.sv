class c_108_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_108_1;
    c_108_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx100zzx01zz1z00x10001x101x01zxxzzxzzzxzzxxxzzzxxzxxzxxzxzxzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

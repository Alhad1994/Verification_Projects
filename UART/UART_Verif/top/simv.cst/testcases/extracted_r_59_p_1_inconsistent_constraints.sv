class c_59_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_59_1;
    c_59_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1x01zzxx01zzx1111101xzx11zz011zzxzzxzxxzxxxzxxxxzxzxxzzxzzzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

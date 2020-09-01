class c_80_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_80_1;
    c_80_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxz0xx10x1zxxzz1zz00zzx0xxxzz00zzzzxxxxxzxxzzzxxxxzxxzxzxxxxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

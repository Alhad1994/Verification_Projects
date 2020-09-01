class c_109_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_109_1;
    c_109_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxzx01zz0100x10xxx1111zzx1x1zz11xxxzxzzzzxzxxzzzzxxxzzxzzxxzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

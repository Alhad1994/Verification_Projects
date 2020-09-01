class c_1_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_1_1;
    c_1_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11x100001z110xx01zzxz0xz0z11100zxxxzxxzzxxzzzzxxxxxzzxxzzxxzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

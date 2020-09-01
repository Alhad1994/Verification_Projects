class c_19_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_19_1;
    c_19_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx1100x100xx110xx0x001zzx0110zzxzxzzxxxzxxxxzzxxzzzzxzxxzzxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_183_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_183_1;
    c_183_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzzz1zzz111zz1z10z11x001xxxxx11xxzzxzxxzzzzxzzxxxzxxxxxxzxxzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

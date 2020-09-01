class c_37_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_37_4;
    c_37_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1100z00z10z10z001zz001xz01xz0z0zzzzzxxxzxxxzzzxxxxzzxzzzxzxzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_175_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_175_1;
    c_175_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz0z1zx1zxxxx10xxzx1xz0100z01zzxzzxzxzzzxzzzxzzzzzzxxzzxzzzzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

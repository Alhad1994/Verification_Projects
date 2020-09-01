class c_196_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_196_1;
    c_196_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx1zzxz0xzzz11z0xx1z0xzz101zz010xxzxxxzxzzzzxxxxxxxzzxxxxzzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_54_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_54_1;
    c_54_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz0xxzz00zxz00010x00zz1010x0xx0zzzzxzxxxzzxzzxxxzzzzxzxxxzxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

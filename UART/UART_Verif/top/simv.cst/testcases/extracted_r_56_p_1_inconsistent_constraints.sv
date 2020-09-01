class c_56_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_56_1;
    c_56_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10zz1zxz1z1010000x1xzzx10zzz1z01xxzxxxxzxxzxzzxzxxzzzxzzzzzxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

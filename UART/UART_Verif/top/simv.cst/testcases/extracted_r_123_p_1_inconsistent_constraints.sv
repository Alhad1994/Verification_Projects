class c_123_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_123_1;
    c_123_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01x0xxxz000xxzxxz0z100x011xx1z01zzxxxxxxzxxzzxzzzzxzxzzxzzxzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
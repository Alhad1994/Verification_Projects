class c_189_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_189_1;
    c_189_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0x11x00z0101zx1x1x01x1zz1xzz1xxzxzxxxxxxxxxzxzzzxxzzxzxxxxzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

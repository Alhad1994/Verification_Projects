class c_52_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_52_1;
    c_52_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx1x01xxz10010x0x11z0110x1z10xzxzxzxxxzzzxxzxzxzxzxxxxzxzzxxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

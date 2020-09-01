class c_184_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_184_1;
    c_184_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x0z0001zzzz0x0111xxx0x1zz1z1zzxxzzxzxzxxxzzzxxxzxzzxxxxxxzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_149_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_149_1;
    c_149_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzxx1zz0xz0z111011zx10xz0xx11xz0zzzxxzxzzzxxzzzxzzxzzxzzzzzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

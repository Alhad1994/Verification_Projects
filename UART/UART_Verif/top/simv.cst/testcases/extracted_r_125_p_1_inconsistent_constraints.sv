class c_125_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_125_1;
    c_125_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x0z10zx001z10xzzxzx0xz001zzxx0xzxxzzzxzxxzzxzxzxxxzxzzxzzzxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

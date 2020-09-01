class c_111_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_111_1;
    c_111_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x1zz1x10zx0z0x1z10xz0xzxz1100z0xxzxzzzxxxzxxzzxxzxzzxxzxzzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

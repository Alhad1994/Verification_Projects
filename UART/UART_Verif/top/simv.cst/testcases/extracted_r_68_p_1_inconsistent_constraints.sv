class c_68_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_68_1;
    c_68_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x101zx0zz111z00x0z001zxzx01xx0x0xxzzzxxzxxxzxzxxzzzxxxxxxzxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

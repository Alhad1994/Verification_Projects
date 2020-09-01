class c_65_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_65_1;
    c_65_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z01x10x0z0001xx010zx11zx11101x1zzxzzxxzzzzzzxxzzxzzzzxxzxxzxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

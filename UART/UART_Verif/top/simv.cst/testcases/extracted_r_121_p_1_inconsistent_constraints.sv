class c_121_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_121_1;
    c_121_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x0011x1z1xz001x01x100111xz001z0xxzxxzzxxzxxxxxzxzxxzxzzzxzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

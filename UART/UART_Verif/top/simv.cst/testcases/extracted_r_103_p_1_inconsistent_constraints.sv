class c_103_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_103_1;
    c_103_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10z1xz1000z1zz01x0001x0xz101z0xxxzxxzzzzzxxxzxxzxxxxzxzzxzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

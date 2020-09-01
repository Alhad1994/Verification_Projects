class c_172_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_172_1;
    c_172_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz1xxz0000x00x1x1xzz111z10100xxzxzzzzxzzxzxzzxzzzzxxzxxzxxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

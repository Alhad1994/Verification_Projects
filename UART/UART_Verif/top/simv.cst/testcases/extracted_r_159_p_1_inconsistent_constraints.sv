class c_159_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_159_1;
    c_159_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx10zx1zxzxxx100x110xz0z1zxxx00zxxzxzxzzxxxzzxxxxzxxzzzzxxzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

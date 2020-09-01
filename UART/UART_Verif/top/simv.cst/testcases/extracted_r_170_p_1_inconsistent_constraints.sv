class c_170_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_170_1;
    c_170_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11xx010z0z1xx1x1z111x0x0zz0x1x00zxxxzxzxxxxxxxzzxzxzxxzzzzzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

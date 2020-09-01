class c_122_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_122_1;
    c_122_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0110zx0xz000001zx00zz0z01011z0zxzzzxxxxzxxxzxzzzzxzzxzxxzxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_31_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_31_1;
    c_31_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "010z1000x1x001zxz1x11000xzxzzzzzzzzzxzxzzzzxxxxzzxzxxxxxzzzxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

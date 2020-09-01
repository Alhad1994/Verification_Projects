class c_78_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_78_1;
    c_78_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0x001z11001x111z1zxx11x1xx0zxx0xxxzxxzxxxzzzzxxxxzxzzzxxzxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

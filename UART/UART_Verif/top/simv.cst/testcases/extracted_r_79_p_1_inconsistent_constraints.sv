class c_79_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_79_1;
    c_79_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x100z0x00110xzx00zz000x0x1z0zxzzzzxxxxzxxxzxzxxzzzzxxzxxzzzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

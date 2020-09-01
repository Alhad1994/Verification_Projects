class c_106_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_106_1;
    c_106_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxx00zz001x0zz1z1xz110zxzx1z00xzxzzzxzzzzxzzxzxxxzxzzxxzxzxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

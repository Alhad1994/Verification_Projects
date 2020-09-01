class c_67_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_67_1;
    c_67_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxz10x0z0xxx00z1xxxxx1x1x1zxx11zxzzzzxxzxxxzxxzxxzzxxzxxxzzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

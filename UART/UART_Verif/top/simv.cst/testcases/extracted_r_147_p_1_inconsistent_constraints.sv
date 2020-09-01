class c_147_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_147_1;
    c_147_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0xxzzxzx00zxx1zzx1xx0z11z011z00zxzxzzzzzzxzxxzxxzxxzxxzxxxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

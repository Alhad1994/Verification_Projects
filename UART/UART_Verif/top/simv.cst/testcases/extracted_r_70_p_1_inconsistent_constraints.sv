class c_70_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_70_1;
    c_70_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx00z0z00zz11xxx1z11z010zz0x01x0zzzzxxzxxzzzxzzxxzxzzzxzxxxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

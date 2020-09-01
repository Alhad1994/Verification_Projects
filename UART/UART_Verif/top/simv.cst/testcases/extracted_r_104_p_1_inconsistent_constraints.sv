class c_104_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_104_1;
    c_104_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "110x0zzzx0101xzxx1xz0xz11xx1z0x1xzzxxxzzzzxxxxxzxxzxxxxzxxzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

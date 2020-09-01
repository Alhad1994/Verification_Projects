class c_94_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_94_1;
    c_94_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1x0x0z10zz111xz11xzzxzxzz1x100xxzxxxxzxzxzzzzxxxxxxzxzxzzxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_10_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_10_1;
    c_10_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x1z100z0000z10z110z0z11xx0zxx1xzzxzxzzzxzzxzxxxzxxzzxxxzxzxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

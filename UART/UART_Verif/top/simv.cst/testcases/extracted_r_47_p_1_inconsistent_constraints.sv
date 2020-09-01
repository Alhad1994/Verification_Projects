class c_47_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_47_1;
    c_47_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x11zx1x1x1zx1x1zxx1zx1010zx11z0xzxzxxxxxzzzzzxzxzzxzzxxzzxxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

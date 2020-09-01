class c_4_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_4_1;
    c_4_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01z1x10x10010zx110zx10z1zxxzxzz0zxzzxxxxxxxzxzxxxxxzzzxzzxxxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

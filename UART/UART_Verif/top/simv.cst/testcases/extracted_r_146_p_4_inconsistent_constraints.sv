class c_146_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_146_4;
    c_146_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10xxz1z01z0zx1z10xx0z1z00xz0001xxxxzzxxzxzzxxxxxzzzzxzxxzxzxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

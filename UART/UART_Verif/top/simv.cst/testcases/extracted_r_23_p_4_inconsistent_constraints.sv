class c_23_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_23_4;
    c_23_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "101z0xxx0xxx00xzzzxzz010z01z1x1xxxxxxzzzzzzzzxxxxzxzxxxzxxxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

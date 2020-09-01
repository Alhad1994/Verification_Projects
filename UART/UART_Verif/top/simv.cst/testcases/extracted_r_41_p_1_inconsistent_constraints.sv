class c_41_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_41_1;
    c_41_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0x0x10zxzzzzz10xz000z1x11xzx1xxzxzzxxzzzzxxzxxxxxzxzzzxxzxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

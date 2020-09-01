class c_57_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_57_1;
    c_57_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0x1x1zx1xz0xz0x1x1x010xz0x01x10xxxxxzzzzzxxzzzzzzzxxzxzxzzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

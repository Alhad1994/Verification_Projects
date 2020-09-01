class c_164_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_164_1;
    c_164_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01zxzx0011zx11xx1zx0zx10010z1x00zxzxzxzxzxxzzxzzxxzxxxxzzzxzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

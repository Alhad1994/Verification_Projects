class c_161_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_161_1;
    c_161_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10010zxxz0xzzxx110z0zx0xx1z1z0x1zxzxxzzzxxxzxzzzzzzxxxxzxzzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

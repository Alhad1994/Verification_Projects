class c_27_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_27_1;
    c_27_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x00zxzz1x01x1xxz111zxx10xzzzx0zzzxzzxzxxxzxzxzxzzxxxzxxxzxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

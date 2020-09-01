class c_163_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_163_4;
    c_163_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxx001xxz1011x1xxx1zz11xz01zx01xzzxzxzxzzzzzxxxzzxxxzzzzzxzxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_77_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_77_1;
    c_77_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1xxxxxxz1zxz00xx1x00zxzzz110z01xzzzxxzzzzxzzxxxzzxzxxxzxxxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

class c_85_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_85_1;
    c_85_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x1zz1xzzx0x0zx0zxxxz0x1110101z0xxxzxxxzzzzxxzxzxxxxzxzxzzxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

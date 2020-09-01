class c_38_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_38_1;
    c_38_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx0x101xxzzx001xxx0z011zx1zxz111xxzxxxxzxxxzxzzzzzzzxzxxxxxxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

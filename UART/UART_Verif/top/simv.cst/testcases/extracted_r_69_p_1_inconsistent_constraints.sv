class c_69_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_69_1;
    c_69_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz1xx111x001z0x0zz1xz0x01xzzx01zxzxxxxzxxzzxzxzxzxxxxxzzzxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

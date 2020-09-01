class c_100_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_100_1;
    c_100_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx01x0zxz100z0101x00z01xzzxx00x1zxzxzzzxxzxxxzxxzzxzxxxxzzxxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

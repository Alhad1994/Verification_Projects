class c_142_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_142_1;
    c_142_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10x00101xxz0z0xzxx01011xzzx0x1xxxzxzzzzzxzzzxzxxxxxzzzzxzzzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

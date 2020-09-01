class c_154_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_154_1;
    c_154_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0011x0x10zxzzzxx0z0x1x0011x0x1x0zzxzzzxxxzxxxzxzxzxzzzzxxxzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

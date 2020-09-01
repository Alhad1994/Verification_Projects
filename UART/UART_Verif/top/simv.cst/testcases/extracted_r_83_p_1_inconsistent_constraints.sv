class c_83_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_83_1;
    c_83_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00zxx0z1zxx01z1x0100zz1z00x0010xzzzzzzzxzzxxxzzxzzzxxzxzxzzzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

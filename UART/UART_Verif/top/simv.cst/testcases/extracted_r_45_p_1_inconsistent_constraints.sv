class c_45_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_45_1;
    c_45_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x0z10z1x1xxzzz0x1zx0zx00111x011xzxzzxzzzzzxxzxxxxzzxxzzzzxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

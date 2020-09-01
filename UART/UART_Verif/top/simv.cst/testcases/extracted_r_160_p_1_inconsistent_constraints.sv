class c_160_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_160_1;
    c_160_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx0x1100101x11xzxxx11x0xx1x1xz1zxzxzxzzzxxxxxxxxxxxzxzzzxzzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram

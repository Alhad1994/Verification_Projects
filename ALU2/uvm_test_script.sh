for i in $(seq 0 9);
do
    sed -i "1s/.*/\`include \"alu${i}.svp\"/" top.sv
    echo $i
    eval "./sv_uvm top.sv > results/output_alu${i}"
done
touch results/summary.txt

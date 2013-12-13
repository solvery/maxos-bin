//---------------------------------------------
//Dump Wave
//---------------------------------------------
module dump_wave();

`ifdef vcd
initial begin
    $dumpfile("tb.vcd");
    $dumpvars();
end
`endif

initial begin
    $fsdbDumpfile("tb.fsdb");
    $fsdbDumpvars(0);
    $fsdbDumpon;
end

`ifdef vpd
initial
begin
	$vcdplusfile("tb.vpd");
	$vcdpluson;
end
`endif

`ifdef vcde
initial
begin
    $dumpports(tb.dut,"tb.vcde");
    $dumpportson;
end
`endif

`ifdef shm
initial
begin
    $shm_open("tb.shm");
    $shm_probe("AS");
end
`endif


initial
begin
	//#(`TIME_OUT);
	//$display("%0t,Quit simulation as TIMEOUT!\n",$time);
	//$stop;
end


//---------------------------------------------
//Sdf Annotate
//---------------------------------------------

`ifdef GSIM
initial
begin
    //$sdf_annotate( "../../syn/opt/ip_syn.sdf", dut,,"sdf_max.log","MAXIMUM");
    //$sdf_annotate( "../../syn/opt/ip_syn.sdf", dut,,"sdf_min.log","MINIMUM");
end
`endif

endmodule


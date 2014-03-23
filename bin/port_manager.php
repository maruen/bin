#!/usr/bin/php -q
<?php


if(isset($argv[1])) {
	$port   				= trim($argv[1]);
	$gammurc_file 		= "/Users/maruen/Local/gammu/ttys/gammurc-$port";
	$imei_config_file = "/Users/maruen/Local/gammu/IMEI.conf"; 

	@exec("/usr/bin/gammu -c $gammurc_file --identify", $rs);
 
	$r = "";
	for($i=0; $i<count($rs); $i++){
 		$r.=$rs[$i]."\r\n";
	}
 
	if (preg_match("/IMEI(.+) : (.+)/",$r,$s)) {
   	$IMEI=trim(str_replace("\n","",$s[2]));
   	$output = file_get_contents($imei_config_file);
   	$output = explode("\n",$output);
   	foreach ($output as $value){
   		list($mapping, $imei) = preg_split('/,/',$value);
   		if ( $IMEI == $imei ) {
      		echo $mapping;
       		exit (0);
   		}
		}
	}
   echo $port;
}
?>

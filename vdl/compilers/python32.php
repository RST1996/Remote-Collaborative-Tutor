<?php
	putenv("PATH=C:\Users\Rishabh Thakur\AppData\Local\Programs\Python\Python36-32\;");
	//echo "hlo there";
	$CC="python";
	//$out="./a.out";
	$code=$_POST["code"];
	$input=$_POST["input"];
	$filename_code="main.py";
	$filename_in="input.txt";
	$filename_error="error.txt";
	$command=$CC." ".$filename_code;
	$command_error=$command." 2>".$filename_error;

	//if(trim($code)=="")
	//die("The code area is empty");

	$file_code=fopen($filename_code,"w+");
	fwrite($file_code,$code);
	fclose($file_code);
	$file_in=fopen($filename_in,"w+");
	fwrite($file_in,$input);
	fclose($file_in);
	//exec("chmod 777 $executable");
	exec("chmod 777 $filename_error");

	//echo $command_error;
	shell_exec($command_error);
	$error=file_get_contents($filename_error);

	if(trim($error)=="")
	{
		if(trim($input)=="")
		{
			$output=shell_exec($command);
		}
		else
		{
			$command=$command." < ".$filename_in;
			$output=shell_exec($command);
		}
		//echo "<pre>$output</pre>";
		$results = $output;
	}
	else
	{
		$results = $error;
		//echo "<pre>$error</pre>";
	}
	exec("rm $filename_code");
	exec("rm *.txt");
?>

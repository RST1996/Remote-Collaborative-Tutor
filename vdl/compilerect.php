<?php

/***********************************           SETTINGS FOR CORS          **********************************************/
	if (!isset($_SERVER['HTTP_ORIGIN'])) {
    	// This is not cross-domain request
	    exit;
	}

	$wildcard = FALSE; // Set $wildcard to TRUE if you do not plan to check or limit the domains
	$credentials = FALSE; // Set $credentials to TRUE if expects credential requests (Cookies, Authentication, SSL certificates)
	$allowedOrigins = array('http://localhost:3000');
	if (!in_array($_SERVER['HTTP_ORIGIN'], $allowedOrigins) && !$wildcard) {
	    // Origin is not allowed
	    exit;
	}
	$origin = $wildcard && !$credentials ? '*' : $_SERVER['HTTP_ORIGIN'];

	header("Access-Control-Allow-Origin: " . $origin);
	if ($credentials) {
	    header("Access-Control-Allow-Credentials: true");
	}
	header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
	header("Access-Control-Allow-Headers: Origin");
	header('P3P: CP="CAO PSA OUR"'); // Makes IE to support cookies

	// Handling the Preflight
	if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') { 
	    exit;
	}

	// Response
	header("Content-Type: application/json; charset=utf-8");

/************************************   MAIN COMPILER START FROM HERE   ***************************************/
	$languageID=$_POST["language"];
        error_reporting(0);


	if($_FILES["file"]["name"]!="")
	{
		include "compilers/make.php";
	}
	else
	{
		switch($languageID)
			{
				case "c":
				{
					include("compilers/c.php");
					break;
				}
				case "cpp":
				{
					include("compilers/cpp.php");
					break;
				}
				case "java":
				{	
					include("compilers/java.php");
					break;
				}
				case "python3":
				{
					include("compilers/python32.php");
					break;
				}
			}
		echo json_encode(array('status' => 'OK','results' => $results));
	}
?>



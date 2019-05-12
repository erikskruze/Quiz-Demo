<?php
/** 
 * Quiz list will be returned in JSON format.
 * No input required.
 */
declare(strict_types=1);

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

/* initiate automatic dependency injection */
require_once '../Helper/Autoloader.php';


/* Init database */
$database = new Config\Database();
/* Can't connect to db */
if( !$database->connect() )
{
	/* Setting error response code  - 500 internal server error */
	http_response_code(500);

	/* Convert array with error message in jason format */
	echo json_encode(array("error" => "Server error"));
}
else
{
	/* Init quiz */
	$quiz = new Object\Quiz($database->conn);

	$stmt = $quiz->read();
	$num = $stmt->rowCount();

	/* No Quizzes found in database */
	if( 0 >= $num )
	{
		/* Setting not found response code  - 404 Not found */
		http_response_code(404);

		/* Convert array with error message in jason format */
		echo json_encode(array("error" => "Not found"));
	}
	/* Quizzes are found in database */
	else
	{
		$quiz_arr=array();
		$quiz_arr["records"]=array();

		/* Go trought all records of quizzes and create array with all records. */
		/* Fetch is bit faster than fetchAll therefore used here */
		while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
		{
			$quiz_item=array(
				"id" => $row['id'],
				"name" => html_entity_decode($row['name'])
			);

			array_push($quiz_arr["records"], $quiz_item);
		}

		/* Setting successfull response code - 200 OK */
		http_response_code(200);

		/* Convert array with quizzes in json format */
		echo json_encode($quiz_arr);
	}
}
?>
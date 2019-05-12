<?php
declare(strict_types=1);

namespace Object;

/**
 * Answer
 */
class Answer{

	private $conn;				/** Database connection. PDO */

	public $id;				/** Id of answer */
	public $text;				/** Text of answer */
	public $is_correct;			/** Is answer correct */


	/**
	 * Constructor for Answer
	 *
	 * @param \PDO $db	Database connection
	 */
	public function __construct($db)
	{
		$this->conn = $db;
	}

	/**
	 * Get list of all available Answers for specified question
	 *
	 * @param int $question_id	Question ID
	 * @return \PDOStatement	PDO statement
	 */
	function read(int $question_id) : \PDOStatement
	{
		/* select all columns from answer */
		$query = "SELECT " . 
				"id, text, is_correct " . 
			"FROM " . 
				"question_id = " . $question_id . 
			"WHERE " . 
				"question_id =  " .
			"ORDER BY " . 
				" id DESC";

		/* prepare query statement */
		$stmt = $this->conn->prepare($query);

		/* execute query */
		if( !$stmt->execute() )
		{
			error_log( __CLASS__ . " | Error: Failed query execution!");
		}

		return $stmt;
	}
}
?>
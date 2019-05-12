<?php
declare(strict_types=1);

namespace Object;

/**
 * Question
 */
class Question{

	private $conn;				/** Database connection. PDO */

	public $id;				/** Id of question */
	public $text;				/** Text of question */


	/**
	 * Constructor for Question
	 *
	 * @param \PDO $db	Database connection
	 */
	public function __construct($db)
	{
		$this->conn = $db;
	}

	/**
	 * Get list of all available Questionzes
	 *
	 * @param int $question_id	Question ID
	 * @return \PDOStatement	PDO statement
	 */
	function read(int $question_id) : \PDOStatement
	{
		/* select all columns for question for specified quiz id */
		/* TODO */
		$query = "";

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
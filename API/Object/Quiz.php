<?php
declare(strict_types=1);

namespace Object;

/**
 * Quiz
 */
class Quiz{

	private $conn;				/** Database connection. PDO */

	public $id;				/** Id of quiz */
	public $name;				/** Name of quiz */


	/**
	 * Constructor for Quiz
	 *
	 * @param \PDO $db	Database connection
	 */
	public function __construct($db)
	{
		$this->conn = $db;
	}

	/**
	 * Get list of all available Quizzes
	 *
	 * @return \PDOStatement
	 */
	function read() : \PDOStatement
	{
		/* select all columns from query */
		$query = "SELECT " . 
				"id, name " . 
			"FROM " . 
				"quiz " . 
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
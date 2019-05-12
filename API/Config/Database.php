<?php
declare(strict_types=1);

namespace Config;

/**
 * Database class to create connection to db
 */
class Database {

	/** 
	 * Database connection parameters. 
	 */
	private $host;		/** database hostname. Mandatory */
	private $db_name;	/** database name. Mandatory */
	private $username;	/** database user. Mandatory */
	private $password;	/** database password. Optional */
	public $conn;		/** database connection. PDO object */


	/**
	 * Get database connection parameters from system environment variables.
	 *
	 * @return bool		Returns TRUE if all mandatory parameters are present 
	 * 			and not empty; otherwise FALSE
	 */
	private function getConfFromEnv() : bool
	{
		$ret = TRUE;

		$this->host = getenv('DBHOST');
		$this->db_name = getenv('DBNAME');
		$this->username = getenv('DBUSR');
		$this->password = getenv('DBPWD');	/* not enccrypted for this demo app */

		if( empty($this->host) || empty($this->db_name) || empty($this->username) )
		{
			error_log( __CLASS__ . " | Error: Mandatory system environment variables " . 
				"(DBHOST, DBNAME, DBUSR) not set!");
			$ret = FALSE;
		}

		return $ret;
	}

	/**
	 * Connect to database
	 *
	 * @return bool	Of connnecton to db successfull return TRUE otherwise FALSE
	 */
	public function connect() : bool
	{
		$ret = $this->getConfFromEnv();
		
		/* try to connect if all requied parameters we have */
		if( $ret )
		{
			try
			{
				$this->conn = new \PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, 
							$this->username, $this->password);
				$this->conn->exec("set names utf8");
			} 
			catch(PDOException $exception)
			{
				$ret = FALSE;
				error_log( __CLASS__ . " | Connection error: " . $exception->getMessage());
			}
		}

		return $ret;
	}

	/**
	 * get database connnection
	 *
	 * @return \PDO	PDO object
	 */
	public function getConnection() : \PDO
	{
		return $this->conn;
	}
}
?>
<?php
/**
 * Autoloader, to load classes automaticaly
 */
class Autoloader {

	/**
	 * load file that contains required class
	 *
	 * @param string $className	Class name with prefixed name space
	 * @return void
	 */
	public static function load(string $className)
	{
		$className = ltrim($className, '\\');
		$fileName  = '';
		$namespace = '';

		if ( $lastNsPos = strrpos($className, '\\') ) 
		{
			$namespace = substr($className, 0, $lastNsPos);
			$className = substr($className, $lastNsPos + 1);
			$fileName  = str_replace('\\', DIRECTORY_SEPARATOR, $namespace) . 
					DIRECTORY_SEPARATOR;
		}

		$fileName .= str_replace('_', DIRECTORY_SEPARATOR, $className) . '.php';

		require_once '../' . $fileName;
	}
}

/* register load function as default auto loader */
spl_autoload_register(array('Autoloader', 'load'));
?>
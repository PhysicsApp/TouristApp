<?php 
	include_once 'config.php';
	
	class Database{
		private static $cont = null;

		public function __construct(){
			exit('Init function is not allowed');
		}

		public static function connect(){
			if(null == self::$cont){
				try{
					self::$cont = new PDO("mysql:host=".Config::$host.";"."dbname=".Config::$name, Config::$username, Config::$password);
					self::$cont->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				}

				catch(PDOException $e){
					die($e->getMessage());

				}
			}//Fin de if

			return self::$cont;
		}

		public static function disconnect(){
			self::$cont = null;

		}
	}
?>
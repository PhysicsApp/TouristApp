<?php
	include_once 'database.php';

	class ResultadoBooleano{
		public $resultado;
		public $mensaje;
	}

	class ResultadoLogin{
		public $resultado;
		public $nombre;
	}

	function verifyAccess($b){
		if(sha1($b)!= Config::$a){
			return false;
		}

		return true;
	}//Fin verifyAccess

//Funcion que no me convence
	function getToken(){
		$token = "Los Alienigenas Nos Atacan";

		return sha1($token);
	}//Fin de getToken

	function login($mail, $password){
		$res = new ResultadoLogin;
		$pdo = Database::connect();
		$nombre = "";
		try{
			$pdo->SetAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$sql = "SELECT mail, contrasena, nombre from USUARIO where mail = ?";
			$q = $pdo-> prepare($sql);
			$q->execute(array($mail));
			$data = $q->fetch(PDO::FETCH_ASSOC);

			if($data == null ){
				Database::disconnect();
				$res->resultado = false;
				//$res->token"";

				return json_encode($res);
			}

			if($mail != $data ['mail']){
				Database::disconnect();
				$res-> resultado = false;
				//$res->token = 'im';
				//$res->token = "";

				return json_encode($res);
			}

			//echo sha1($password);

			if($data['contrasena'] != sha1($password)){
				Database::disconnect();
				$res-> resultado = false;
				//$res->token = $data['v'];
				//$res->token = "";

				return json_encode($res);
			}
			$nombre = $data['nombre'];
			Database::disconnect();
		}//Fin de try

		catch(PDOException $e){

			return json_encode(0);
		}

		$res->resultado = true;
		$res->nombre = $nombre;
		return json_encode($res);

		//$res->resultado = true;
	}//Fin de login 

	function registro($name, $mail, $password){

		try{
			$pdo = Database::connect();
			$pdo->SetAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$sql = "INSERT INTO USUARIO VALUES(?, ?, ?, ?)";
			$q = $pdo->prepare($sql);
			$result = $q->execute(array($name, null, $mail, sha1($password)));
			Database::disconnect();
		}
		catch(PDOException $e){
			return json_encode(0);
		}
		return login($mail, $password);
	}//fin de registro

	function actualizarImagen($imagen, $mail){
		try{
			$pdo = Database::connect();
			$pdo->SetAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$sql = "UPDATE USUARIO SET imagen = ? WHERE mail = ?";
			$q = $pdo->prepare($sql);
			$res = $q->execute(array($imagen, $mail));
			Database::disconnect();
		}
		catch(PDOException $e){
			return json_encode(0);
		}
		return json_encode($res);
	}//fin actualizar imagen

	function getSubcategorias($categoria)
    {
        try{
            $pdo = Database::connect();
           $pdo->SetAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
           $sql = "SELECT nombre, idSub FROM SUBCATEGORIA WHERE refCat = ?";
           $q = $pdo->prepare($sql);
           $res = $q->execute(array($categoria));
           //$res = $q->fetch(PDO::FETCH_ASSOC);
           $res = $q->fetchAll(PDO::FETCH_ASSOC);
           Database::disconnect();
        }
        catch(PDOException $e){
            return json_encode(0);
        }
        return json_encode($res);
    }

    function anadirSubCategoria($idUsuario, $idSubCat)
    {
    	try
    	{
            $pdo = Database::connect();
           	$pdo->SetAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
           	$sql = "INSERT INTO USUARIO_SUBCAT VALUES(?, ?)";
           	$q = $pdo->prepare($sql);
           	$res = $q->execute(array($idUsuario, $idSubCat));
           	Database::disconnect();
    	}
    	catch(PDOException $e)
    	{
    		return json_encode(0);
    	}
    	return json_enconde(1);
    }

?>
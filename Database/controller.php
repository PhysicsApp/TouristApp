<?php

	include 'functions.php';

	if(empty($_POST)){
		echo 'error empty post';
		exit();
	}

	$function = $_POST['funcion'];
	switch($function){
		case 'login':
			echo login($_POST['mail'], $_POST['password']);
			break;

		case 'registro':

			echo registro($_POST['name'], $_POST['mail'], $_POST['password']);
			break;	

		case 'getSubcategorias':
			echo getSubcategorias($_POST['categoria']);
			break;
		case 'anadirSubCategoria':
			echo anadirSubCategoria($_POST['idUsuario'], $_POST['idSubCat']);
			break;
	}
?>

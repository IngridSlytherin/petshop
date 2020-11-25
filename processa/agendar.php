<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Pet Shop</title>
		<link href="../css/bootstrap.min.css" rel='stylesheet' type='text/css' />
		<link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
		<script type="text/javascript" src="../js/bootstrap.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!----webfonts---->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
		<!----//webfonts---->
		<link href="../css/theme.css" rel='stylesheet' type='text/css' />
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<!--start slider -->
		<link rel="stylesheet" href="../css/fwslider.css" media="all">
		<script src="../js/jquery-ui.min.js"></script>
		<script src="../js/css3-mediaqueries.js"></script>
		<script src="../js/fwslider.js"></script>
		<!--end slider -->
		<!--  jquery plguin -->
		<script src="../js/login.js"></script>
		<script src="../js/modernizr.custom.js"></script>

	</head>
	<body>

		<!--- features--->
		<div class="container">
			<div class="row">
				<div class="content-feature-grids" id="features">
					<h3> Obrigada <?php echo $_POST['txtNome'];?></h3>
					<p>
						<?php

									include_once '../class/ManipulaBanco.class.php';
									$conexao = new ManipulaBanco;
									
									
									$dataagenda = array('nomeCliente' => $_POST['txtNome'],
									'emailCliente' => $_POST['txtEmail'], 'senhaCliente' => $_POST['txtSenha'],
									'telcliente' => $_POST['txtTel']);
									//
									$conexao->inserirRegistro("cliente", $dataagenda);
									$buscaCliente = $conexao->selecionarRegistro("cliente", "idcliente", "WHERE emailcliente ='{$_POST['txtEmail']}'","ORDER BY idcliente DESC","LIMIT 1"); 
									
									$idCliente = $buscaCliente[0]->idcliente;
									
									$ordemServico = array('dataServ'=>date('d/m/Y'),"cliente_idcliente"=>$idCliente);
									$conexao->inserirRegistro("ordemServico", $ordemServico);
									$buscaOrdemservico = $conexao->selecionarRegistro("ordemServico","idordemServico","WHERE cliente_idcliente = {$idCliente}","ORDER BY idordemServico DESC","LIMIT 1");
									$idOrdemServico = $buscaOrdemservico[0]->idordemServico;
									
									
									foreach ($_POST['Servico'] as $value) {
										echo $value;
										$servicosItem = array('ordemServico_idordemServico'=>$idOrdemServico,'tipoServico_idtable1'=>$value);
										$conexao->inserirRegistro("ordemServico_has_tipoServico", $servicosItem);
									}
									
									$nomePet = array('tipoPet'=>$_POST['txtTipoPet'],'nomePet'=>$_POST['txtPet']);
									echo "<pre>";
									var_dump($nomePet);
									echo "</pre>";
									$conexao->inserirRegistro("pet", $nomePet);
									$buscaNomePet = $conexao->selecionarRegistro("pet","idpet","WHERE nomePet = '".$_POST['txtPet']."'","ORDER BY idpet DESC","LIMIT 1");
									$idPet = $buscaNomePet[0]->idpet;
									
									$petCliente = array('pet_idpet'=>$idPet,'cliente_idcliente'=>$idCliente);
									$conexao->inserirRegistro("pet_has_cliente", $petCliente);
									
									$petServico = array('ordemServico_idordemServico'=>$idOrdemServico,'pet_idpet'=>$idPet);
									$conexao->inserirRegistro("ordemServico_has_pet", $petServico);
									?>
                                    
                                    
						<a href="../index.html"> Voltar a pagina inicial</a>
					</p>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
		</div>

	</body>
</html>


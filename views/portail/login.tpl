<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

    <title>Agrur | Login</title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">

</head>

<body class="row gray-bg">

    <div class="col-xs-4"></div>
	<div class="col-xs-4">
        <div>
            <div>

                <h1>VDEV Framework+</h1>

            </div>
            <h3>Bienvenue sur la page d'authentification</h3>
            <p>Ici, l'espace de connexion de l'utilisateur.</p>
            <p>Cette opération permettra une navigation sécurisée dans l'ERP<br />
            ainsi que la gestion des droits de ce dernier.</p>
            <p>Connexion | Authentification</p>
            <div>
                <div class="form-group">
                <input id="login" name="login" type="email" class="form-control" placeholder="@ Email" required="">
                </div>
                <div class="form-group">
                <input id="password" name="password" type="password" class="form-control" placeholder="Mot de passe" required="">
                </div>
                <button type="submit" id="connexion" class="btn btn-primary">Login</button>
            </div>
            <p class="help-block"><small>Web solution by VDEV &copy; 2017</small></p>
        </div>
    </div>
    <div class="col-xs-4"></div>

    <!-- Mainly scripts -->
    <script src="/includes/js/jquery-2.1.1.js"></script>
    <script src="/includes/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$("#connexion").on("click", function(){
			var login = document.getElementById("login").value;
			var password = document.getElementById("password").value;
					$.post("/portail/auth",{loginU : login, passwordU : password}, function(retour){
					retour = retour.replace(/^\s+|\s+$/gm,'');
					if (retour == "admin"){
						document.location.href="/admin/manage";
					} else if(retour == "regular"){
						document.location.href="/regular/home";
					} else {
						alert('BAD LOGIN OR PASSWORD !')
					}}, "text");
				});
	</script>

</body>
</html>
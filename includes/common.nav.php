<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->	

    <title>MyOwnMVC |   <?php foreach($listAxx as $page){
                                if($page['url_page'] == substr($_SERVER['REQUEST_URI'], 1)){
                                    echo $page['name_page'];
                                }
                            }
                        ?>
    </title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">

</head>

<body>
    <nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="  <?php
                                            switch($_SESSION['user']['rank']){
                                                case('admin'):
                                                    echo '/admin/manage';
                                                    break;
                                                case('regular'):
                                                    echo '/regular/home';
                                                    break;
                                                }
                                        ?>">VDEV+</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <?php foreach($listAxx as $page){if($page['url_page'] == "admin/exempleAdmin"){ ?>
                <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/exempleAdmin') echo 'active'; ?>"><a href="/admin/exempleAdmin">Lien autorisé Admin</a></li>
            <?php }} ?>
            <?php foreach($listAxx as $page){if($page['url_page'] == "regular/exempleRegular"){ ?>
                <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='regular/exempleRegular') echo 'active'; ?>"><a href="/regular/exempleRegular">Lien autorisé Regular</a></li>
            <?php }} ?>
            <li><a href="/portail/logout">Log Out</a></li>
        </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
    </nav>
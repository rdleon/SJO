<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 
	* Gobierno del Estado de Nuevo León.
	* Sistema de Gestión de Proyectos.
	* Fecha de Creación: 11-marzo-2018
	* Autor: Neftalí López E.
	 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="images/icons/favicon.ico">
    <link rel="apple-touch-icon" href="images/icons/favicon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/icons/favicon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/icons/favicon-114x114.png">
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
    <link type="text/css" rel="stylesheet" href="styles/jquery-ui-1.10.4.custom.min.css">
    <link type="text/css" rel="stylesheet" href="styles/font-awesome.min.css">
     
    <!-- 
    <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
     -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <!-- 
    <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
     -->
     
    <link type="text/css" rel="stylesheet" href="styles/animate.css">
    <link type="text/css" rel="stylesheet" href="styles/all.css">
    <link type="text/css" rel="stylesheet" href="styles/main.css">
    <link type="text/css" rel="stylesheet" href="styles/style-responsive.css">
    <link type="text/css" rel="stylesheet" href="styles/zabuto_calendar.min.css">
    <link type="text/css" rel="stylesheet" href="styles/pace.css">
    <link type="text/css" rel="stylesheet" href="styles/jquery.news-ticker.css">
	
	
<title>GENL - Sistema de Gestión de Proyectos</title>
</head>
<body>

<!-- 
<a href="/getProjects">Portafolio de Proyectos</a>
 -->
 
  
    <div> <!-- BEGIN MAIN DIV -->
        <!--BEGIN BACK TO TOP-->
        <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        <!--END BACK TO TOP-->
        
        <!--BEGIN TOPBAR-->
        <div id="header-topbar-option-demo" class="page-header-topbar">
            <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
            <div class="navbar-header">
                <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
                </button>
                <a id="logo" href="/getProjects" class="navbar-brand"><img src="images/genl_logo.png" class="logo-responsive" width="106" height="44" /></a>
            </div>
            <div class="topbar-main"><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a>
                <div class="news-update-box hidden-xs" style="margin-left:150px;"><span class="text-uppercase mrm pull-left text-white">News:</span>
                    <ul id="news-update" class="ticker list-unstyled">
                        <li>Gobierno del Estado de Nuevo León</li>
                        <li>Sistema de Gestión de Proyectos.</li>
                    </ul>
                </div>
                <ul class="nav navbar navbar-top-links navbar-right mbn">
                    <li class="dropdown topbar-user"><a data-hover="dropdown" href="#" class="dropdown-toggle"><img src="images/avatar/imagen-Jaime-Rodriguez-Calderon_48.jpg" alt="" class="img-responsive img-circle"/>&nbsp;<span class="hidden-xs">Jaime Rodríguez C.</span>&nbsp;<span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-user pull-right">
                            <li><a href="#"><i class="fa fa-user"></i>Mi Perfil</a></li>
                            <li><a href="#"><i class="fa fa-calendar"></i>Mi Calendario</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i>Mi Buzón</a></li>
                            <li><a href="#"><i class="fa fa-tasks"></i>Mis Tareas</a></li>
                            <li class="divider"></li>
                            <!-- 
                            <li><a href="#"><i class="fa fa-lock"></i>Bloquear Pantalla</a></li>
                             -->
                            <li><a href="Login.html"><i class="fa fa-key"></i>Salir</a></li>
                        </ul>
                    </li>
                    <!-- 
                    <li id="topbar-chat" class="hidden-xs"><a href="javascript:void(0)" data-step="4" data-intro="&lt;b&gt;Form chat&lt;/b&gt; keep you connecting with other coworker" data-position="left" class="btn-chat"><i class="fa fa-comments"></i><span class="badge badge-info">3</span></a></li>
                	 -->
                </ul>
            </div>
        </nav>
        </div>
        
        <!--END TOPBAR-->
        <div id="wrapper">
            <!--BEGIN SIDEBAR MENU-->
            <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
                data-position="right" class="navbar-default navbar-static-side">
            <div class="sidebar-collapse menu-scroll">
                <ul id="side-menu" class="nav">
                    
                    <div class="clearfix"></div>
                    <li class="active"><a href="dashboard.html">
                    	<i class="fa fa-tachometer fa-fw">
                       	 <div class="icon-bg bg-orange"></div>
                    	</i>
                    	<span class="menu-title">Tablero</span></a>
                    </li>
                    <li><a href="#Administracion">
                    	<i class="fa fa-cogs fa-fw"><div class="icon-bg bg-pink"></div></i>
                   		<span class="menu-title">Administración</span><span class="fa fa-chevron-left pull-right"></span>
                   		</a>
			              <ul class="nav">
			              	<li></li>
			                <li><a href="#">
		                    	<i class="fa fa-users fa-fw" style="margin-left:25px;"><div class="icon-bg bg-pink"></div></i>
		                   		<span class="menu-title">Grupos</span></span>
			                </a>
			                </li>
			                <li><a href="#">
		                    	<i class="fa fa-check fa-fw" style="margin-left:25px;"><div class="icon-bg bg-red"></div></i>
		                   		<span class="menu-title">Roles</span></span>
			                </a>
			                </li>
			                <li><a href="#">
		                    	<i class="fa fa-user fa-fw" style="margin-left:25px;"><div class="icon-bg bg-orange"></div></i>
		                   		<span class="menu-title">Usuarios</span></span>
			                </a>
			                <li><a href="#">
		                    	<i class="fa fa-list-alt fa-fw" style="margin-left:25px;"><div class="icon-bg bg-gray"></div></i>
		                   		<span class="menu-title">Proveedores</span></span>
			                </a>
			                <li><a href="#">
		                    	<i class="fa fa-database fa-fw" style="margin-left:25px;"><div class="icon-bg bg-pink"></div></i>
		                   		<span class="menu-title">Catálogos</span></span>
			                </a>
			                </li>
			              </ul>
                    </li>
                    <li><a id="portfolio" href="#"><i class="fa fa-briefcase fa-fw">
                        <div class="icon-bg bg-green"></div>
                    </i><span class="menu-title">Portafolio</span></a>                       
                    </li>
                    <li><a href="Forms.html"><i class="fa fa-sitemap fa-fw">
                        <div class="icon-bg bg-violet"></div>
                    </i><span class="menu-title">Definición de Proyecto</span></a>
                      
                    </li>
                    <li><a href="Tables.html"><i class="fa fa-tasks fa-fw">
                        <div class="icon-bg bg-blue"></div>
                    </i><span class="menu-title">Gestión de Proyecto</span></a>                          
                    </li>
                    <li><a href="DataGrid.html"><i class="fa fa-table fa-fw">
                        <div class="icon-bg bg-red"></div>
                    </i><span class="menu-title">Reportes</span></a>                 
                    </li>
                </ul>
            </div>
        </nav>
            <!--END SIDEBAR MENU-->
            
            
            <!--BEGIN CHAT FORM-->
            <div id="chat-form" class="fixed">
                <div class="chat-inner">
                    <h2 class="chat-header">
                        <a href="javascript:;" class="chat-form-close pull-right"><i class="glyphicon glyphicon-remove">
                        </i></a><i class="fa fa-user"></i>&nbsp; Chat &nbsp;<span class="badge badge-info">3</span></h2>
                    <div id="group-1" class="chat-group">
                        <strong>Favorites</strong><a href="#"><span class="user-status is-online"></span> <small>
                            Verna Morton</small> <span class="badge badge-info">2</span></a><a href="#"><span
                                class="user-status is-online"></span> <small>Delores Blake</small> <span class="badge badge-info is-hidden">
                                    0</span></a><a href="#"><span class="user-status is-busy"></span> <small>Nathaniel Morris</small>
                                        <span class="badge badge-info is-hidden">0</span></a><a href="#"><span class="user-status is-idle"></span>
                                            <small>Boyd Bridges</small> <span class="badge badge-info is-hidden">0</span></a><a
                                                href="#"><span class="user-status is-offline"></span> <small>Meredith Houston</small>
                                                <span class="badge badge-info is-hidden">0</span></a></div>
                    <div id="group-2" class="chat-group">
                        <strong>Office</strong><a href="#"><span class="user-status is-busy"></span> <small>
                            Ann Scott</small> <span class="badge badge-info is-hidden">0</span></a><a href="#"><span
                                class="user-status is-offline"></span> <small>Sherman Stokes</small> <span class="badge badge-info is-hidden">
                                    0</span></a><a href="#"><span class="user-status is-offline"></span> <small>Florence
                                        Pierce</small> <span class="badge badge-info">1</span></a></div>
                    <div id="group-3" class="chat-group">
                        <strong>Friends</strong><a href="#"><span class="user-status is-online"></span> <small>
                            Willard Mckenzie</small> <span class="badge badge-info is-hidden">0</span></a><a
                                href="#"><span class="user-status is-busy"></span> <small>Jenny Frazier</small>
                                <span class="badge badge-info is-hidden">0</span></a><a href="#"><span class="user-status is-offline"></span>
                                    <small>Chris Stewart</small> <span class="badge badge-info is-hidden">0</span></a><a
                                        href="#"><span class="user-status is-offline"></span> <small>Olivia Green</small>
                                        <span class="badge badge-info is-hidden">0</span></a></div>
                </div>
                <div id="chat-box" style="top: 400px">
                    <div class="chat-box-header">
                        <a href="#" class="chat-box-close pull-right"><i class="glyphicon glyphicon-remove">
                        </i></a><span class="user-status is-online"></span><span class="display-name">Willard
                            Mckenzie</span> <small>Online</small>
                    </div>
                    <div class="chat-content">
                        <ul class="chat-box-body">
                            <li>
                                <p>
                                    <img src="images/avatar/imagen-Jaime-Rodriguez-Calderon_128.jpg" class="avt" /><span class="user">Jaime Rodríguez Calderón</span><span
                                        class="time">09:33</span></p>
                                <p>
                                    Hi Swlabs, we have some comments for you.</p>
                            </li>
                            <li class="odd">
                                <p>
                                    <img src="images/avatar/imagen-Jaime-Rodriguez-Calderon_48.jpg" class="avt" /><span class="user">Swlabs</span><span
                                        class="time">09:33</span></p>
                                <p>
                                    Hi, we're listening you...</p>
                            </li>
                        </ul>
                    </div>
                    <div class="chat-textarea">
                        <input placeholder="Type your message" class="form-control" /></div>
                </div>
            </div>
            <!--END CHAT FORM-->
            
            <!--BEGIN PAGE WRAPPER-->
            <div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            Tablero</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">Tablero</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">Tablero</li>
                    </ol>
                    <div class="clearfix">
                    </div>
                </div>
                <!--END TITLE & BREADCRUMB PAGE-->
                
            <div id="content_page" class="container-fluid">
  				<h1>HOLA</h1>
			</div>
                
                
                
                <!--BEGIN CONTENT-->
                <div class="page-content">
                    <div id="tab-general">
                        <div id="sum_box" class="row mbl">
                            <div class="col-sm-6 col-md-3">
                                <div class="panel profit db mbm">
                                    <div class="panel-body">
                                        <p class="icon">
                                            <i class="icon fa fa-money"></i>
                                        </p>
                                        <h4 class="value">
                                            <span data-counter="" data-start="10" data-end="50" data-step="1" data-duration="0">
                                            </span><span>$</span></h4>
                                        <p class="description">
                                            Presupuesto Total</p>
                                        <div class="progress progress-sm mbn">
                                            <div role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
                                                style="width: 80%;" class="progress-bar progress-bar-success">
                                                <span class="sr-only">80% Complete (success)</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="panel income db mbm">
                                    <div class="panel-body">
                                        <p class="icon">
                                            <i class="icon fa fa-money"></i>
                                        </p>
                                        <h4 class="value">
                                            <span>215</span><span>$</span></h4>
                                        <p class="description">
                                            Presupuesto Ejercido</p>
                                        <div class="progress progress-sm mbn">
                                            <div role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                                style="width: 60%;" class="progress-bar progress-bar-info">
                                                <span class="sr-only">60% Complete (success)</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="panel task db mbm">
                                    <div class="panel-body">
                                        <p class="icon">
                                            <i class="icon fa fa-signal"></i>
                                        </p>
                                        <h4 class="value">
                                            <span>215</span></h4>
                                        <p class="description">
                                            Tareas Completadas</p>
                                        <div class="progress progress-sm mbn">
                                            <div role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
                                                style="width: 50%;" class="progress-bar progress-bar-danger">
                                                <span class="sr-only">50% Complete (success)</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="panel visit db mbm">
                                    <div class="panel-body">
                                        <p class="icon">
                                            <i class="icon fa fa-group"></i>
                                        </p>
                                        <h4 class="value">
                                            <span>128</span></h4>
                                        <p class="description">
                                            Recursos</p>
                                        <div class="progress progress-sm mbn">
                                            <div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
                                                style="width: 70%;" class="progress-bar progress-bar-warning">
                                                <span class="sr-only">70% Complete (success)</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mbl">
                            <div class="col-lg-8">
                                <div class="panel">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <h4 class="mbs">
                                                    Uso del Presupuesto. Línea 3 del Metro</h4>
                                                <p class="help-block">
                                                    Presupuesto Plan vs. Real. Cifras en mmdp</p>
                                                <div id="area-chart-spline" style="width: 100%; height: 300px">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <h4 class="mbm">
                                                    Indicadores Generales</h4>
                                                <span class="task-item">Presupuesto Plan<small class="pull-right text-muted">40%</small><div class="progress progress-sm">
                                                    <div role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                                        style="width: 40%;" class="progress-bar progress-bar-orange">
                                                        <span class="sr-only">40% Complete (success)</span></div>
                                                </div>
                                                </span><span>Presupuesto Real<small class="pull-right text-muted">60%</small><div class="progress progress-sm">
                                                    <div role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                                        style="width: 60%;" class="progress-bar progress-bar-blue">
                                                        <span class="sr-only">60% Complete (success)</span></div>
                                                </div>
                                                </span><span>Tiempo Plan<small class="pull-right text-muted">55%</small><div class="progress progress-sm">
                                                    <div role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"
                                                        style="width: 55%;" class="progress-bar progress-bar-green">
                                                        <span class="sr-only">55% Complete (success)</span></div>
                                                </div>
                                                </span><span>Tiempo Real<small class="pull-right text-muted">66%</small><div class="progress progress-sm">
                                                    <div role="progressbar" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"
                                                        style="width: 66%;" class="progress-bar progress-bar-yellow">
                                                        <span class="sr-only">66% Complete (success)</span></div>
                                                </div>
                                                </span><span>Tareas Planeadas<small class="pull-right text-muted">90%</small><div class="progress progress-sm">
                                                    <div role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
                                                        style="width: 90%;" class="progress-bar progress-bar-pink">
                                                        <span class="sr-only">90% Complete (success)</span></div>
                                                </div>
                                                </span><span>Tareas Finalizadas<small class="pull-right text-muted">50%</small><div class="progress progress-sm">
                                                    <div role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
                                                        style="width: 50%;" class="progress-bar progress-bar-violet">
                                                        <span class="sr-only">50% Complete (success)</span></div>
                                                </div>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="portlet box">
                                    <div class="portlet-header">
                                        <div class="caption">
                                            Chats</div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="chat-scroller">
                                            <ul class="chats">
                                                <li class="in">
                                                    <img src="images/avatar/imagen-Jaime-Rodriguez-Calderon_48.jpg" class="avatar img-responsive" />
                                                    <div class="message">
                                                        <span class="chat-arrow"></span><a href="#" class="chat-name">Gober</a>&nbsp;<span
                                                            class="chat-datetime">Julio 06, 2019 11:06</span><span class="chat-body">¿Porqué seguimos atrasados?. Por favor necesito que te reunas con Jesús.</span></div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="chat-form">
                                            <div class="input-group">
                                                <input id="input-chat" type="text" placeholder="Type a message here..." class="form-control" /><span
                                                    id="btn-chat" class="input-group-btn">
                                                    <button type="button" class="btn btn-green">
                                                        <i class="fa fa-check"></i>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                            
                        </div>

                            
                        </div>
                       
                        
                    </div>
                </div>
                <!--END CONTENT-->
                <!--BEGIN FOOTER-->
                <div id="footer">
                    <div class="copyright">
                        <a href="http://themifycloud.com">Gobierno del Estado de Nuevo León</a></div>
                </div>
                <!--END FOOTER-->
            </div>
            <!--END PAGE WRAPPER-->
        </div>
    </div><!-- END MAIN DIV -->
    
    <!-- JS -->
    
    <!-- 
    <script src="script/jquery-1.10.2.min.js"></script>
    <script src="script/jquery-migrate-1.2.1.min.js"></script>
     -->
    
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
    
    
    <script src="script/jquery-ui.js"></script>
    
    <!-- 
    <script src="script/bootstrap.min.js"></script>
     -->
    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <!--  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
     -->
     
    <script src="script/bootstrap-hover-dropdown.js"></script>
    <script src="script/html5shiv.js"></script>
    <script src="script/respond.min.js"></script>
    <script src="script/jquery.metisMenu.js"></script>
    <script src="script/jquery.slimscroll.js"></script>
    <script src="script/jquery.cookie.js"></script>
    <script src="script/icheck.min.js"></script>
    <script src="script/custom.min.js"></script>
    <script src="script/jquery.news-ticker.js"></script>
    <script src="script/jquery.menu.js"></script>
    <script src="script/pace.min.js"></script>
    <script src="script/holder.js"></script>
    <script src="script/responsive-tabs.js"></script>
    <script src="script/jquery.flot.js"></script>
    <script src="script/jquery.flot.categories.js"></script>
    <script src="script/jquery.flot.pie.js"></script>
    <script src="script/jquery.flot.tooltip.js"></script>
    <script src="script/jquery.flot.resize.js"></script>
    <script src="script/jquery.flot.fillbetween.js"></script>
    <script src="script/jquery.flot.stack.js"></script>
    <script src="script/jquery.flot.spline.js"></script>
    <script src="script/zabuto_calendar.min.js"></script>
    <script src="script/index.js"></script>
    <!--LOADING SCRIPTS FOR CHARTS-->
    <script src="script/highcharts.js"></script>
    <script src="script/data.js"></script>
    <script src="script/drilldown.js"></script>
    <script src="script/exporting.js"></script>
    <script src="script/highcharts-more.js"></script>
    <script src="script/charts-highchart-pie.js"></script>
    <script src="script/charts-highchart-more.js"></script>
    <!--CORE JAVASCRIPT-->
    <script src="script/main.js"></script>
    <script>
    	(function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-145464-12', 'auto');
        ga('send', 'pageview');

	</script>
	
			<script type="text/javascript">
			$(document).ready(function() {
				try {
					$("#portfolio").click(function(event) {
						alert("Ok");
						$("#content_page").load('/getProjects');
					});
				}catch(err){
					alert("Error:"+err);
				}
			});
		</script>
	
</body>
</html>
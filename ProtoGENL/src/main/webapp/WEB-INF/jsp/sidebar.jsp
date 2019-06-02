<!-- 
/******************************************************
* <h1>Gobierno del Estado de Nuevo León</h1>
* <h2>Sistema de Gestión de Obra Pública</h2>
*
* @author Neftalí López E.
* @version 1.0
* @since 2019
* Fecha de Creación: 11 mar 2019
* Descripcion: Menú lateral
* Ultimo Cambio:
* Fecha del Ultimo Cambio:
********************************************************/
 -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <div class="sjo-logo-big">
                	    <img width="244" height="119" class="img-fluid" src="<c:url value="images/logo.png" />">
                    </div>
                    <div class="sjo-logo-small">
                	    <img width="244" height="119" class="img-fluid" src="<c:url value="images/escudo.png" />">
                    </div>                
                </div>

                <ul class="list-unstyled components">
                	<!-- 
                    <li>
                        <a href="#homeSubmenu" data-toggle="collapse">
                            <i class="fa fa-cogs fa-fw"></i>
                            <span class="menu-title">Administración</span><span class="fa fa-chevron-left"></span>
                        </a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
			                <li><a href="#">
		                    	<i class="fa fa-users fa-fw" style="margin-left:25px;"></i>
		                   		<span class="menu-title">Grupos</span>
			                </a>
			                </li>
			                <li><a href="#">
		                    	<i class="fa fa-check fa-fw" style="margin-left:25px;"></i>
		                   		<span class="menu-title">Roles</span>
			                </a>
			                </li>
			                <li><a href="#">
		                    	<i class="fa fa-user fa-fw" style="margin-left:25px;"></i>
		                   		<span class="menu-title">Usuarios</span>
			                </a>
			                </li><li><a href="#">
		                    	<i class="fa fa-list-alt fa-fw" style="margin-left:25px;"></i>
		                   		<span class="menu-title">Proveedores</span>
			                </a>
			                </li><li><a href="#">
		                    	<i class="fa fa-database fa-fw" style="margin-left:25px;"></i>
		                   		<span class="menu-title">Catálogos</span>
			                </a>
			                </li>                     
			             </ul>
                    </li>
                     -->
                    <li id="li_providers"><a href="/providers"><i class="fa fa-address-card fa-fw">
                    </i><span class="menu-title">Proveedores</span></a>                       
                    </li>
                    <li id="li_contracts"><a href="/contracts"><i class="fa fa-file fa-fw">
                    </i><span class="menu-title">Contratos</span></a>                       
                    </li>
                    <li id="li_projects"><a href="/projects"><i class="fa fa-sitemap fa-fw">
                    </i><span class="menu-title">Proyectos</span></a>
                    </li>
                    <li id="li_follow_up"><a href="/follow_up"><i class="fa fa-tasks fa-fw">
                    </i><span class="menu-title">Registro de Avance</span></a>                          
                    </li>
                    <li id="li_contracts"><a href="#"><i class="fa fa-table fa-fw">
                    </i><span class="menu-title">Reportes</span></a>                 
                    </li>
                    <li id="li_dashboard"><a href="/dashboard"><i class="fa fa-list-alt fa-fw">
                    </i><span class="menu-title">Tableros</span></a>
                    </li>
                    
                </ul>
            </nav>

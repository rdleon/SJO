<!-- 
/******************************************************
* <h1>Gobierno del Estado de Nuevo León</h1>
* <h2>Sistema de Gestión de Obra Pública</h2>
*
* @author Neftalí López E.
* @version 1.0
* @since 2019
* Fecha de Creación: 11 mar 2019
* Descripcion: Tablero de Gráficos e Inidicadores
* Ultimo Cambio:
* Fecha del Ultimo Cambio:
********************************************************/
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ page errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
	<head>
		<%@include file="header.jsp" %>
        <title>Tableros</title>
    </head>
    <body>

        <div class="wrapper">
            <!-- Sidebar Holder -->
			<%@include file="sidebar.jsp" %>


            <!-- Page Content Holder -->
            <div id="content" class="container-fluid">

			<!-- Nav Bar -->
			<%@include file="navbar.jsp" %>

                <!--BEGIN TITLE & BREADCRUMB PAGE-->
				<jsp:include page="breadcrumb.jsp" >
				  <jsp:param name="path" value="getPortfolio@Portafolio|getPortfolio@Test" />
				</jsp:include>                
                <!--END TITLE & BREADCRUMB PAGE-->
                

				<!-- PAGE CONTENT -->
                <!--BEGIN CONTENT-->
                <div class="container-fluid">
                	<br>
                	<div class="row">
                           <div class="col-lg-12">
                             <div class="portlet box">
                                <div class="portlet-header">
                                    <div class="caption">Estatus de Obras 15 Mayo 2019</div>
                                    <div class="tools">
                                        <!--
                                        <i class="fa fa-chevron-up"></i>
                                        <i data-toggle="modal" data-target="#modal-config" class="fa fa-cog"></i>
                                        <i class="fa fa-refresh"></i>
                                        <i class="fa fa-times"></i>
                                        -->
                                    </div>
                                </div>
                               		  <div class="portlet-body">
	                                    <div class="row">
	                                        <div class="col-md-4 col-sm-6">
	                                            <label for="message-text" class="col-form-label"><b>Dependencia:</b></label>
	                                            <select id="dependency" class="form-control " required="">
	                                                <option value="0">--Seleccione una Dependencia--</option>
	                                                <option value="14">TOTAL</option>
	                                                <option value="1">INFRAESTRUCTURA</option>
	                                                <option value="2">ICIFED</option>
	                                                <option value="3">REA</option>
	                                                <option value="4">SADM</option>
	                                                <option value="5">SSNL</option>
	                                                <option value="6">CODETUR</option>
	                                                <option value="7">CODEFRONT</option>
	                                                <option value="8">FIDEPROES</option>
	                                                <option value="9">DIF</option>
	                                                <option value="10">FUNDIDORA</option>
	                                                <option value="11">CONALEP</option>
	                                                <option value="12">CAMINOS</option>
	                                                <option value="13">ISSSTELEON</option>
	                                            </select>
	                                            <div class="invalid-feedback">Debe seleccionar una dependencia</div>
	                                        </div>
	                                       </div>
	                                    <div id="genl-pie-chart" style="width: 100%; height:400px">
	                                    </div>
	                                    <div id="genl-legend-pie-chart" style="color: #444">
	                                    </div>
                                	</div>
 								</div>
                        	</div>
					</div>
 				</div>
                            
				
				<div class="lds-roller"  id="waintingAnimation" >
                    <div> </div>
                    <div> </div>
                    <div> </div>
                    <div> </div>
                    <div> </div>
                    <div> </div>
                    <div> </div>
                    <div> </div>
                </div>

                <!-- For wainting animation of ellipsis, uncomment CSS -->
                <!--
                <div class="lds-ellipsis">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                -->
				
				
				<!--END CONTENT-->
                   
                <!--BEGIN FOOTER-->
                <div id="footer">
                    <div class="copyright">
                        <a href="#">Gobierno del Estado de Nuevo León</a></div>
                </div>
                <!--END FOOTER-->

            
            </div>
        </div>


<!-- Include JS Libraries  -->
<%@include file="footer.jsp" %>

	    
    <!--CORE JAVASCRIPT-->
    <script src="script/main.js"></script>
  
	<script type="text/javascript">
	    $(document).ready(function () {

	    	$("#li_dashboard").addClass("active");
	    	
	        //Button toggle for sidebar
	        $('#sidebarCollapse').on('click', function () {
	            $('#sidebar').toggleClass('active');
	        });
	    
	        //Select the dependency 
	        $('#dependency').on('change', function() {
	       	    var id = this.value;
	            loadDataPieChart( id-1 );
	      	});
	        if(document.getElementById('dependency').value != 0){
	            var idP = document.getElementById('dependency').value;
	            loadDataPieChart( idP-1 );
	        }
	
	    }); //End On Ready
	</script>
  
    
</body></html>

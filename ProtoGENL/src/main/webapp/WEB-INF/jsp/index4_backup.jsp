<!-- 
/******************************************************
* <h1>Gobierno del Estado de Nuevo León</h1>
* <h2>Sistema de Gestión de Obra Pública</h2>
*
* @author Neftalí López E.
* @version 1.0
* @since 2019
* Fecha de Creación: 11 mar 2019
* Descripcion: Página Inicial Predeterminada del Sistema
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
        <title>Sistema de Obra Pública</title>
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
				  			<br>
				
							<h1>Bienvenido al Sistema de Obra Pública</h1>
                		
                		</div>
                	</div>


                
                </div>
                
                <!--BEGIN FOOTER-->
                <div id="footer">
                    <div class="copyright">
                        <a href="http://themifycloud.com">Gobierno del Estado de Nuevo León</a></div>
                </div>
                <!--END FOOTER-->

            
            </div>
        </div>


<!-- Include JS Libraries  -->
<%@include file="footer.jsp" %>

	    
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
             $(document).ready(function () {
                 
				$('#sidebarCollapse').on('click', function () {
				    $('#sidebar').toggleClass('active');
				});

         </script>
         
         <script>
         // Meter aquí el evento para validar la forma antes del submit
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
		  'use strict';
		  window.addEventListener('load', function() {
		    // Fetch all the forms we want to apply custom Bootstrap validation styles to
		    var forms = document.getElementsByClassName('needs-validation');
		    // Loop over them and prevent submission
		    var validation = Array.prototype.filter.call(forms, function(form) {
		      form.addEventListener('submit', function(event) {
		        if (form.checkValidity() === false) {
		          event.preventDefault();
		          event.stopPropagation();
		        }
		        form.classList.add('was-validated');
		      }, false);
		    });
		  }, false);
		})();
		</script>
    
</body></html>

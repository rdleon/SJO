<!-- 
/******************************************************
* <h1>Gobierno del Estado de Nuevo León</h1>
* <h2>Sistema de Gestión de Obra Pública</h2>
*
* @author Neftalí López E.
* @version 1.0
* @since 2019
* Fecha de Creación: 11 mar 2019
* Descripcion: CRUD Portafolio de Proyectos
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

				            <!-- CRUD Buttons -->  
				            <div class="container-fluid" id="content_page">
				  				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Nuevo</button>
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Editar</button>
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Eliminar</button>
							</div>
				  			<br>
				
							<!-- Project DatTable -->
							<div class="container-fluid" >
								<table id="example" class="display nowrap" style="width:100%">
							        <thead>
							            <tr>
							                <th>Name</th>
							                <th>Position</th>
							                <th>Office</th>
							                <th>Extn.</th>
							                <th>Start date</th>
							                <th>Salary</th>
							            </tr>
							        </thead>
							        <tfoot>
							            <tr>
							                <th>Name</th>
							                <th>Position</th>
							                <th>Office</th>
							                <th>Extn.</th>
							                <th>Start date</th>
							                <th>Salary</th>
							            </tr>
							        </tfoot>
							    </table>			
							
							</div>
				
							<!-- CRUD Buttons -->		
				            <div class="container-fluid" id="content_page">
				  				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Nuevo</button>
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Editar</button>
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Eliminar</button>
							</div>
                		
                		</div>
                	</div>

					<!-- BEGIN Modal Form for Project -->
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Nuevo Proyecto</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <form class="needs-validation" novalidate>
					          <div class="form-group">
					            <label for="recipient-name" class="col-form-label">Nombre del Proyecto:</label>
					            <input type="text" class="form-control" id="name" required>
					            <div class="invalid-feedback">Debe proporcionar un nombre al nuevo proyecto</div>
					          </div>
					          <div class="form-group">
					            <label for="message-text" class="col-form-label">Dependencia:</label>
					            <select class="form-control form-control-sm" required>
					            	<option></option>
		  							<option>Obras Públicas</option>
		  							<option>Seguirdad Pública</option>
		  							<option>DIF</option>
								</select>
								<div class="invalid-feedback">Debe seleccionar una dependencia</div>
					          </div>
					          <div class="form-group">
					            <label for="version" class="col-form-label">Versión:</label>
					            <input type="text" class="form-control" id="version">
					          </div>
					          <div class="form-group">
					            <label for="budget" class="col-form-label">Presupuesto:</label>
					            <input type="text" class="form-control" id="budget" required>
					            <div class="invalid-feedback">Debe asignar un presupuesto al proyecto</div>
					          </div>
					          <div class="form-group">
					            <label for="status" class="col-form-label">Estatus:</label>
					            <select class="form-control form-control-sm" id="status" required>
		  							<option>En proceso</option>
		  							<option>Finalizado</option>
		  							<option>Detenido</option>
		  							<option>Cancelado</option>
		  							<option>Bloqueado</option>
								</select>
								<div class="invalid-feedback">Debe asignar un estatus al proyecto</div>
		  					  </div>
					          <div class="form-group">
								  <input class="form-check-input" type="checkbox" value="" id="bloqued">
								  <label class="form-check-label" for="defaultCheck1">Bloqueado</label>			          
					          </div>
					        </form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
					        <button type="submit" class="btn btn-primary">Guardar</button>
					      </div>
					    </div>
					  </div>
					</div>
                	<!-- END Modal Form for Project -->
                
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

				var table = $('#example').DataTable( {
			        "ajax": 'http://ec2-15-164-48-84.ap-northeast-2.compute.amazonaws.com:8080/mock/json_data_table2.txt',
			        dom: 'Bfrtip',
			        buttons: [
			            'copy', 'csv', 'excel', 'pdf', 'print'
			        ],
			        /*"columns": [
			            { "data": "name" },
			            { "data": "position" },
			            { "data": "office" },
			            { "data": "extn" },
			            { "data": "sdate" },
			            { "data": "salary" }
			        ],*/
			        rowId: 'DT_RowId'
			    });

			    $('#exampleModal').on('show.bs.modal', function (event) {
			    	  var button = $(event.relatedTarget) // Button that triggered the modal
			    	  var recipient = button.data('whatever') // Extract info from data-* attributes
			    	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			    	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			    	  var modal = $(this)
			    	  //modal.find('.modal-title').text('New message to ' + recipient)
			    	  modal.find('.modal-title').text('Nuevo Proyecto');
			    	  //modal.find('.modal-body input').val(recipient)
				});

			    $('#example tbody').on( 'click', 'tr', function () {
			        if ( $(this).hasClass('selected') ) {
			            $(this).removeClass('selected');
			        }else{
			            table.$('tr.selected').removeClass('selected');
			            $(this).addClass('selected');
			        }
			    });

			    $('#example').on( 'click', 'tr', function () {
			        try {
			        	/*var table2 = $('#example').DataTable();
			        	alert("table2:"+table2);
				        var id = table2.row( this ).id();			     
				        alert( 'Clicked row id '+id );
				        */

				        var table2 = $('#example').DataTable();
				        var id = table2.row( this ).data()[0];
				        console.log("Issue id: "+id);
				        alert( 'Clicked row id '+id );
				    }catch(err){
					    alert("Error:"+err);
					}
			    });
			 
			    /*$('#button').click( function () {
			        //table.row('.selected').remove().draw( false );
			        table.row('.selected').
			    });
			    */
                
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

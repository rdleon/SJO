<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
	<head>
		<%@include file="header.jsp" %>
        <title>Portafolio de Proyectos</title>
    </head>
    <body>

        <div class="wrapper">
            <!-- Sidebar Holder -->
			<%@include file="sidebar.jsp" %>


            <!-- Page Content Holder -->
            <div id="content">

			<!-- Nav Bar -->
			<%@include file="navbar.jsp" %>

                <!--BEGIN TITLE & BREADCRUMB PAGE-->
				<jsp:include page="breadcrumb.jsp" >
				  <jsp:param name="path" value="getPortfolio@Portafolio|getPortfolio@Test" />
				</jsp:include>                
                <!--END TITLE & BREADCRUMB PAGE-->
                
            <div class="container-fluid" id="content_page">
  				<!-- 
  				<h1>HOLA</h1>
  				 -->
  				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Nuevo</button>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Editar</button>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Eliminar</button>
			</div>
  				 <br>

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
			
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Nuevo</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Editar</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Eliminar</button>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>

				<!-- PAGE CONTENT -->
                <!--BEGIN CONTENT-->
                <div class="page-content">
                    <div id="tab-general">
                        <div class="row mbl" id="sum_box">
                            <div class="col-sm-6 col-md-3">
                                <div class="profit db mbm card">
                                    <div class="card-block">
                                        <p class="icon">
                                            <i class="icon fa fa-money"></i>
                                        </p>
                                        <h4 class="value">
                                            <span data-duration="0" data-step="1" data-end="50" data-start="10" data-counter="">
                                            </span><span>$</span></h4>
                                        <p class="description">
                                            Presupuesto Total</p>
                                        <div class="progress progress-sm mbn">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
                                                <span class="sr-only">80% Complete (success)</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="income db mbm card">
                                    <div class="card-block">
                                        <p class="icon">
                                            <i class="icon fa fa-money"></i>
                                        </p>
                                        <h4 class="value">
                                            <span>215</span><span>$</span></h4>
                                        <p class="description">
                                            Presupuesto Ejercido</p>
                                        <div class="progress progress-sm mbn">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                                <span class="sr-only">60% Complete (success)</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="task db mbm card">
                                    <div class="card-block">
                                        <p class="icon">
                                            <i class="icon fa fa-signal"></i>
                                        </p>
                                        <h4 class="value">
                                            <span>215</span></h4>
                                        <p class="description">
                                            Tareas Completadas</p>
                                        <div class="progress progress-sm mbn">
                                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
                                                <span class="sr-only">50% Complete (success)</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="visit db mbm card">
                                    <div class="card-block">
                                        <p class="icon">
                                            <i class="icon fa fa-group"></i>
                                        </p>
                                        <h4 class="value">
                                            <span>128</span></h4>
                                        <p class="description">
                                            Recursos</p>
                                        <div class="progress progress-sm mbn">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;">
                                                <span class="sr-only">70% Complete (success)</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mbl">
                            <div class="col-lg-8">
                                <div class="card">
                                    <div class="card-block">
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
                                                <span class="task-item">Presupuesto Plan<small class="text-muted">40%</small><div class="progress progress-sm">
                                                    <div class="progress-bar progress-bar-orange" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                                                        <span class="sr-only">40% Complete (success)</span></div>
                                                </div>
                                                </span><span>Presupuesto Real<small class="text-muted">60%</small><div class="progress progress-sm">
                                                    <div class="progress-bar progress-bar-blue" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                                        <span class="sr-only">60% Complete (success)</span></div>
                                                </div>
                                                </span><span>Tiempo Plan<small class="text-muted">55%</small><div class="progress progress-sm">
                                                    <div class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100" style="width: 55%;">
                                                        <span class="sr-only">55% Complete (success)</span></div>
                                                </div>
                                                </span><span>Tiempo Real<small class="text-muted">66%</small><div class="progress progress-sm">
                                                    <div class="progress-bar progress-bar-yellow" role="progressbar" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100" style="width: 66%;">
                                                        <span class="sr-only">66% Complete (success)</span></div>
                                                </div>
                                                </span><span>Tareas Planeadas<small class="text-muted">90%</small><div class="progress progress-sm">
                                                    <div class="progress-bar progress-bar-pink" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
                                                        <span class="sr-only">90% Complete (success)</span></div>
                                                </div>
                                                </span><span>Tareas Finalizadas<small class="text-muted">50%</small><div class="progress progress-sm">
                                                    <div class="progress-bar progress-bar-violet" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
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
                                                    <img class="avatar img-fluid" src="images/avatar/imagen-Jaime-Rodriguez-Calderon_48.jpg">
                                                    <div class="message">
                                                        <span class="chat-arrow"></span><a class="chat-name" href="#">Gober</a>&nbsp;<span class="chat-datetime">Julio 06, 2019 11:06</span><span class="chat-body">¿Porqué seguimos atrasados?. Por favor necesito que te reunas con Jesús.</span></div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="chat-form">
                                            <div class="input-group">
                                                <input class="form-control" id="input-chat" type="text" placeholder="Type a message here..."><span class="input-group-btn" id="btn-chat">
                                                    <button class="btn btn-green" type="button">
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

				$("#portfolio").click(function(event) {
					alert("Ok");
					$("#content_page").load('/getProjects');
				});

				var table = $('#example').DataTable( {
			        "ajax": 'http://ec2-15-164-48-84.ap-northeast-2.compute.amazonaws.com:8080/json_data_table2.txt',
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
			    	  modal.find('.modal-title').text('New message to ' + recipient)
			    	  modal.find('.modal-body input').val(recipient)
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
    
</body></html>

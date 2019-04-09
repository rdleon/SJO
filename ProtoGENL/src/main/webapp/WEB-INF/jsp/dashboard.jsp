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
	                                <div class="caption">Estatus de Obras</div>
	                                <div class="tools"><i class="fa fa-chevron-up"></i><i data-toggle="modal" data-target="#modal-config" class="fa fa-cog"></i><i class="fa fa-refresh"></i><i class="fa fa-times"></i></div>
	                            </div>
	                            <div class="portlet-body">
									<div class="row">
										<div class="col-lg-2">
											<label for="message-text" class="col-form-label"><b>Dependencia:</b></label>
											<select id="dependency" class="form-control form-control-sm" required>
												<option value="0">--Seleccione una Dependencia--</option>
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
												<option value="14">TOTAL</option>
											</select>
											<div class="invalid-feedback">Debe seleccionar una dependencia</div>
										</div>
							       	</div>
	                                <div id="genl-pie-chart" style="width: 100%; height:400px"></div>
	                            </div>
	                        </div>
                        </div>
                    </div>
                            
				</div>
                   
               	<!-- BEGIN MODAL TABLE -->
               	<div class="modal" tabindex="-1" role="dialog" id="myModalTable">
				  <div class="modal-dialog" style="max-width:80%!important;" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">Estatus de la Obra</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      	<div class="table-responsive">
							<table class="table table-striped table-bordered" style="margin-bottom: 0">
							  <thead class="thead-dark">
							    <tr>
									<th scope="col">No.</th>
									<th scope="col">Municipio</th>
									<th scope="col">Categoría</th>
									<th scope="col">Obra</th>
									<th scope="col">Empresa</th>
									<th scope="col">No. Contrato</th>
									<th scope="col">Monto Contratado</th>
									<th scope="col">Inicio Según Contrato</th>
									<th scope="col">Término Según Contrato</th>
									<th scope="col">Fecha Pago Anticipo</th>
									<th scope="col">Monto del Anticipo</th>
									<th scope="col">Terminación Compromiso 2018</th>
									<th scope="col">Fecha Convenio Ampliación</th>
									<th scope="col">Convenio Ampliación Económico</th>
									<th scope="col">Monto Contrato Final</th>
									<th scope="col">Total Pagado</th>
									<th scope="col">Fecha Pago Anticipo</th>
									<th scope="col">Anticipo Pendiente  Amortizar</th>
									<th scope="col">Avance Financiero</th>
									<th scope="col">Avance Físico Verificado</th>
									<th scope="col">Entregada al Beneficiario</th>
									<th scope="col">Fecha Verificación</th>
									<th scope="col">Estatus Verificado</th>
									<th scope="col">Registro Visita</th>
									<th scope="col">Registro Visita</th>
							    </tr>
							  </thead>
							  <tbody>
<!-- NLE: Esta sección se hizo hard coded solo para fines demostrativos -->							  
<tr><th scope="row">1</th><td>Anáhuac</td><td>Construcción</td><td>EDIFICACIÓN DE OFICINAS OPERATIVAS.</td><td>Too Diseño y Construcción, S.A. de C.V.</td><td>CDF-CDP-12/2017</td><td>$12,987,360.00</td><td>12-jun-17</td><td>20-abr-18</td><td>07-jun-17</td><td>$3,207,226.96</td><td></td><td>10-nov-17</td><td>$2,296,603.46</td><td>$15,283,963.46</td><td>$12,803,404.01</td><td></td><td>$0.00</td><td>100%</td><td>100%</td><td>Entregada</td><td>21-ene-19</td><td>Obra Terminada</td><td class="text-center"><img style="width:100%;" class="img-responsive" src="https://unsplash.it/164/90"/></td><td class="text-center"><img style="width:100%;" class="img-responsive" src="https://unsplash.it/164/91"/></td></tr>
<tr><th scope="row">2</th><td>Anáhuac</td><td>Construcción</td><td>TRABAJOS DE SEGURIDAD VIAL PARA MEJORAS DE LA SUPERFICIE DE RODAMIENTO EN EL CEFACIL, UBICADO EN COLOMBIA MUNICIPIO DE ANÁHUAC, NUEVO LEÓN.</td><td>Too Diseño Diseño y Construcción, S.A. de C.V.</td><td>CDF-CDP-007/2018</td><td>$8,550,448.64</td><td>03-sep-18</td><td>10-dic-18</td><td>30-ago-18</td><td>$2,565,134.59</td><td></td><td>Sin Convenio  </td><td>$0.00</td><td>$8,550,448.64</td><td>$8,550,448.64</td><td></td><td>$0.00</td><td>100%</td><td>100%</td><td>Entregada</td><td>21-ene-19</td><td>Obra Terminada</td><td class="text-center"><img style="width:100%;" class="img-responsive" src="https://unsplash.it/164/90"/></td><td class="text-center"><img style="width:100%;" class="img-responsive" src="https://unsplash.it/164/91"/></td></tr>
<tr><th scope="row">3</th><td>Anáhuac</td><td>Rehabilitación</td><td>HABILITACIÓN DE CIRCULACIÓN INTERIOR DE LA ESTACIÓN CUARENTENARIA.</td><td>Constructora Pérez Martínez del Puerto, S.A. de C.V.</td><td>CDF-CDP-14/2017</td><td>$4,604,866.05</td><td>25-sep-17</td><td>05-ene-18</td><td>03-oct-17</td><td>$1,256,816.47</td><td></td><td>07-dic-17</td><td>$415,477.81</td><td>$5,020,343.86</td><td>$4,214,141.38</td><td></td><td>$0.00</td><td>8%</td><td>100%</td><td>Entregada</td><td>21-ene-19</td><td>Obra Terminada</td><td class="text-center"><img style="width:100%;" class="img-responsive" src="https://unsplash.it/164/90"/></td><td class="text-center"><img style="width:100%;" class="img-responsive" src="https://unsplash.it/164/91"/></td></tr>
<tr><th scope="row">4</th><td>Anáhuac</td><td>Rehabilitación</td><td>TRABAJOS DE DESMONTE y ESCARIFICADO DEL PREDIO IDENTIFICADO COMO DERECHO DE PASO DE FFCC UBICADO EN COLOMBIA, MUNICIPIO DE ANÁHUAC, NUEVO LEÓN.</td><td>Obras Pavimentos Construcción y Servicios, S.A. de C.V.</td><td>CDF-CDP-008/2018</td><td>$2,832,945.48</td><td>24-sep-18</td><td>24-oct-18</td><td>20-sep-18</td><td>$849,883.64</td><td></td><td>Sin Convenio  </td><td>$0.00</td><td>$2,832,945.47</td><td>$2,832,945.48</td><td></td><td>$0.00</td><td>100%</td><td>100%</td><td>Entregada</td><td>21-ene-19</td><td>Obra Terminada</td><td class="text-center"><img style="width:100%;" class="img-responsive" src="https://unsplash.it/164/90"/></td><td class="text-center"><img style="width:100%;" class="img-responsive" src="https://unsplash.it/164/91"/></td></tr>
<tr><th scope=""row"">1</th><td>Anáhuac</td><td>Construcción</td><td>CONSTRUCCIÓN DE CONTENEDOR DE SUSTANCIAS PELIGROSAS PARA PUENTE SOLIDARIDAD-COLOMBIA, MUNICIPIO DE ANÁHUAC, NUEVO LEÓN.</td><td>Basement Construcciones, S.A. de C.V.</td><td>CDF-CDP-06/2018</td><td>$5,304,622.10</td><td>05-jul-18</td><td>05-dic-18</td><td>09-jul-18</td><td>$1,591,386.63</td><td></td><td>Sin Convenio  </td><td>$0.00</td><td>$5,304,622.10</td><td>$3,905,697.59</td><td></td><td>$419,677.35</td><td>74%</td><td>92%</td><td>No Entregada</td><td>12-mar-19</td><td>OBRA EN PROCESO.

La obra se encuentra detenida en espera de que llegue el equipo detector de los químicos para que una vez en el lugar de la obra se proceda a su correcta instalación y a finiquitar los detalles que permanecen pendientes por realizar.</td><td class="text-center"><img style="width:100%;" class="img-responsive" src=""https://unsplash.it/164/90"/></td><td class="text-center"><img style="width:100%;" class="img-responsive" src="https://unsplash.it/164/91"/></td></tr>
							  </tbody>
							</table>
						</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
				      </div>
				    </div>
				  </div>
				</div>
               	<!-- END MODAL TABLE -->
               	
                   
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
	
	<script>
		function loadModalTable(id, name, value) {
			//alert("id="+id+", name="+name+", value="+value);
			$('#myModalTable').modal('show');
		}	
	</script>


         <script type="text/javascript">
             $(document).ready(function () {
                 
				$('#sidebarCollapse').on('click', function () {
				    $('#sidebar').toggleClass('active');
				});

			    $('#dependency').on('change', function() {
					//alert( this.value );
					var id=this.value;
					try {
					   //var data = $.get("http://localhost:8080/mock/json_data_dashboard"+id+".txt");
					   //strJSon = JSON.stringify(data);
					   //alert(strJSon);
					   var strJSon = "";
					   var data;
					   var JSonArray = new Array(14);
					   JSonArray[0]='[{"name":"TERMINADAS","y":28,"color":"yellow"},{"name":"EN TIEMPO","y":17,"color":"green"},{"name":"CON RETRASO","y":31,"color":"red"},{"name":"RESCINDIDAS","y":2,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":4,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":11,"color":"blue"}]';
					   JSonArray[1]='[{"name":"TERMINADAS","y":216,"color":"yellow"},{"name":"EN TIEMPO","y":11,"color":"green"},{"name":"CON RETRASO","y":92,"color":"red"},{"name":"RESCINDIDAS","y":5,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":0,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":0,"color":"blue"}]';
					   JSonArray[2]='[{"name":"TERMINADAS","y":27,"color":"yellow"},{"name":"EN TIEMPO","y":4,"color":"green"},{"name":"CON RETRASO","y":23,"color":"red"},{"name":"RESCINDIDAS","y":0,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":1,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":0,"color":"blue"}]';
					   JSonArray[3]='[{"name":"TERMINADAS","y":14,"color":"yellow"},{"name":"EN TIEMPO","y":10,"color":"green"},{"name":"CON RETRASO","y":18,"color":"red"},{"name":"RESCINDIDAS","y":0,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":0,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":0,"color":"blue"}]';
					   JSonArray[4]='[{"name":"TERMINADAS","y":33,"color":"yellow"},{"name":"EN TIEMPO","y":1,"color":"green"},{"name":"CON RETRASO","y":0,"color":"red"},{"name":"RESCINDIDAS","y":0,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":0,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":0,"color":"blue"}]';
					   JSonArray[5]='[{"name":"TERMINADAS","y":5,"color":"yellow"},{"name":"EN TIEMPO","y":1,"color":"green"},{"name":"CON RETRASO","y":1,"color":"red"},{"name":"RESCINDIDAS","y":0,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":0,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":0,"color":"blue"}]';
					   JSonArray[6]='[{"name":"TERMINADAS","y":4,"color":"yellow"},{"name":"EN TIEMPO","y":0,"color":"green"},{"name":"CON RETRASO","y":1,"color":"red"},{"name":"RESCINDIDAS","y":0,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":0,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":0,"color":"blue"}]';
					   JSonArray[7]='[{"name":"TERMINADAS","y":1,"color":"yellow"},{"name":"EN TIEMPO","y":0,"color":"green"},{"name":"CON RETRASO","y":2,"color":"red"},{"name":"RESCINDIDAS","y":0,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":1,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":1,"color":"blue"}]';
					   JSonArray[8]='[{"name":"TERMINADAS","y":3,"color":"yellow"},{"name":"EN TIEMPO","y":0,"color":"green"},{"name":"CON RETRASO","y":1,"color":"red"},{"name":"RESCINDIDAS","y":0,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":0,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":0,"color":"blue"}]';
					   JSonArray[9]='[{"name":"TERMINADAS","y":2,"color":"yellow"},{"name":"EN TIEMPO","y":1,"color":"green"},{"name":"CON RETRASO","y":0,"color":"red"},{"name":"RESCINDIDAS","y":0,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":0,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":0,"color":"blue"}]';
					   JSonArray[10]='[{"name":"TERMINADAS","y":1,"color":"yellow"},{"name":"EN TIEMPO","y":0,"color":"green"},{"name":"CON RETRASO","y":1,"color":"red"},{"name":"RESCINDIDAS","y":0,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":0,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":0,"color":"blue"}]';
					   JSonArray[11]='[{"name":"TERMINADAS","y":0,"color":"yellow"},{"name":"EN TIEMPO","y":0,"color":"green"},{"name":"CON RETRASO","y":2,"color":"red"},{"name":"RESCINDIDAS","y":0,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":0,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":0,"color":"blue"}]';
					   JSonArray[12]='[{"name":"TERMINADAS","y":0,"color":"yellow"},{"name":"EN TIEMPO","y":1,"color":"green"},{"name":"CON RETRASO","y":0,"color":"red"},{"name":"RESCINDIDAS","y":0,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":0,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":0,"color":"blue"}]';
					   JSonArray[13]='[{"name":"TERMINADAS","y":334,"color":"yellow"},{"name":"EN TIEMPO","y":46,"color":"green"},{"name":"CON RETRASO","y":172,"color":"red"},{"name":"RESCINDIDAS","y":7,"color":"gray"},{"name":"AVANCE FINANCIERO MAYO AL FÍSICO","y":6,"color":"orange"},{"name":"OBRAS DE FUERZA CIVIL POLICÍA Y PENALES","y":12,"color":"blue"}]';
					   
						if (id==0) {
							alert("Debes seleccionar una dependencia.");
						}else {
							strJSon = JSonArray[id-1];
							data = JSON.parse(strJSon);
							const options = {
									chart: {
									  type: 'pie',
									  plotBackgroundColor: null,
									  plotBorderWidth: null,
									  plotShadow: false    
									},
									title: {
									  text: 'GENL, 2019'
									},
									tooltip: {
									  pointFormat: '<b>{point.percentage:.1f} %</b>'
									},
									plotOptions: {
									  pie: {
									    allowPointSelect: true,
									    cursor: 'pointer',
							            point: {
							                events: {
							                    click: function () {
							                        //alert('Point: ' + this.name + ', value: ' + this.y);
							                        loadModalTable(id, this.name, this.y);
							                    }
							                }
							            },									    
									    dataLabels: {
									      enabled: true,
									      color: '#000000',
									      connectorColor: '#000000',
									      format: '<b>{point.name}</b>: {point.y:.0f}'
									    }
									  }
									},
									
									series: [{
									  data: []
									}]
								};
							const chart = Highcharts.chart('genl-pie-chart', options);
							chart.series[0].setData(data);
						}
					}catch(err){
						alert("Error:"+err)
					}			    	
			    				    	  
			   	});
				
                
             }); //End On Ready

             
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

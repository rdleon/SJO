 <!-- 
/******************************************************
* <h1>Gobierno del Estado de Nuevo León</h1>
* <h2>Sistema de Gestión de Obra Pública</h2>
*
* @author Neftalí López E.
* @version 1.0
* @since 2019
* Fecha de Creación: 11 mar 2019
* Descripcion: Include con las referencias a librerías JavaScript. NO MODIFICAR SIN AUTORIZACION.
* Ultimo Cambio:
* Fecha del Ultimo Cambio:
********************************************************/
 -->
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
		<!-- Bootstrap Js CDN -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		
		<script src="https://www.jqueryscript.net/demo/Dialog-Modal-Dialogify/dist/dialogify.min.js?v2"></script>
		
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
		
		<!-- Others -->
		<script src="<c:url value="script/jsonpath-0.8.0.js" />"></script>
		<script src="<c:url value="script/jquery.inputmask.bundle.min.js" />"></script>		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.2.26/jquery.autocomplete.min.js"></script>
		<!-- 
	    <script src="<c:url value="script/jquery-ui.js" />"></script>
	     -->
	    <!-- 
	    <script src="<c:url value="script/bootstrap-hover-dropdown.js" />"></script>
	    <script src="<c:url value="script/html5shiv.js" />"></script>
	    <script src="<c:url value="script/respond.min.js" />"></script>
	    <script src="<c:url value="script/jquery.metisMenu.js" />"></script>
	    <script src="<c:url value="script/jquery.slimscroll.js" />"></script>
	    <script src="<c:url value="script/jquery.cookie.js" />"></script>
	    <script src="<c:url value="script/icheck.min.js" />"></script>
	    <script src="<c:url value="script/custom.min.js" />"></script>
	    <script src="<c:url value="script/jquery.news-ticker.js" />"></script>
	    <script src="<c:url value="script/jquery.menu.js" />"></script>
	    <script src="<c:url value="script/pace.min.js" />"></script>
	    <script src="<c:url value="script/holder.js" />"></script>
	    <script src="<c:url value="script/responsive-tabs.js" />"></script>
	    <script src="<c:url value="script/jquery.flot.js" />"></script>
	    <script src="<c:url value="script/jquery.flot.categories.js" />"></script>
	    <script src="<c:url value="script/jquery.flot.pie.js" />"></script>
	    <script src="<c:url value="script/jquery.flot.tooltip.js" />"></script>
	    <script src="<c:url value="script/jquery.flot.resize.js" />"></script>
	    <script src="<c:url value="script/jquery.flot.fillbetween.js" />"></script>
	    <script src="<c:url value="script/jquery.flot.stack.js" />"></script>
	    <script src="<c:url value="script/jquery.flot.spline.js" />"></script>
	    <script src="<c:url value="script/zabuto_calendar.min.js" />"></script>
	    <script src="<c:url value="script/index.js" />"></script>
	     -->
	    
	    <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	    <!-- 
	    <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.jqueryui.min.js"></script>
	     -->
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.flash.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>
	     
	    <!-- SCRIPTS FOR CHARTS-->
	    <script src="https://code.highcharts.com/highcharts.js"></script>
	    <!-- 
	    <script src="<c:url value="script/highcharts.js" />"></script>
	     -->
	    <script src="<c:url value="script/data.js" />"></script>
	    <script src="<c:url value="script/drilldown.js" />"></script>
	    <script src="<c:url value="script/exporting.js" />"></script>
	    <script src="<c:url value="script/highcharts-more.js" />"></script>    
	    <!-- 
	    <script src="<c:url value="script/genl_charts-highchart-pie.js" />"></script>
	     -->
	    <script src="<c:url value="script/charts-highchart-more.js" />"></script>
	    <script src="<c:url value="script/charts-flotchart.js" />"></script>
	    
	    <!-- OTHER -->
	    <!-- Datepicker Bootstrap 44 -->
	    <script src="https://daemonite.github.io/material/js/material.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/gh/moment/moment@develop/min/moment-with-locales.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/gh/djibe/bootstrap-material-datetimepicker@83a10c38ee94dd27fd946ea137af6667c65a738f/js/bootstrap-material-datetimepicker-bs4.min.js"></script>
	    <!-- Easyautocomplete -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/easy-autocomplete/1.3.5/jquery.easy-autocomplete.min.js"></script>
	    
	    <!-- OWNER SCRIPT  -->
	    <script src="<c:url value="script/genl_obras_core.js" />" charset="UTF-8"></script>
	    <script src="<c:url value="script/genl_crud_restfull.js?v=37" />" charset="UTF-8"></script>
	    
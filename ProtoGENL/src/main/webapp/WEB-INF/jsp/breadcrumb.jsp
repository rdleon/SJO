<!-- 
/******************************************************
* <h1>Gobierno del Estado de Nuevo León</h1>
* <h2>Sistema de Gestión de Obra Pública</h2>
*
* @author Neftalí López E.
* @version 1.0
* @since 2019
* Fecha de Creación: 11 mar 2019
* Descripcion: Include para el Breadcrumb
* Ultimo Cambio:
* Fecha del Ultimo Cambio:
********************************************************/
 -->
<%
String strPair="", uri="", name="";
String[] pair;
String strPath = request.getParameter("path");
System.out.println("strPath="+strPath);
String[] elements = strPath.split("|");

/*
NOTA: ESTA SECCION SE ENCUENTRA EN DESARROLLO. EL PATH DEBE FORMARSE DINÁMICAMENTE.
*/

%>
                <div class="page-title-breadcrumb" id="title-breadcrumb-option-demo">
                    <ol class="breadcrumb page-breadcrumb">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="/index">Inicio</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
<%
	/*
					for (int i=0;i<elements.length;i++) {
						strPair = elements[i];
						System.out.println("elements[i]="+elements[i]);
						System.out.println("strPair="+strPair);
						pair = strPair.split("@");
						System.out.println("pair="+pair);
						uri=pair[0];
						System.out.println("uri="+uri);
						name=pair[1];
						if (i==(elements.length-1)) {
%>                        
                        <li class="active"><%=name%></li>
<%						}else{ 
%>
                        <li class="hidden"><a href="<%=uri%>"><%=name%></a>
                        &nbsp;&nbsp;<i class="fa fa-angle-right"></i>
                        &nbsp;&nbsp;</li>
<%
						}
					}
	*/
%>                         
                    </ol>
                    <div class="clearfix"></div>
                </div>

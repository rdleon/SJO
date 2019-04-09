/******************************************************
* <h1>Gobierno del Estado de Nuevo León</h1>
* <h2>Sistema de Gestión de Obra Pública</h2>
*
* @author Neftalí López E.
* @version 1.0
* @since 2019
* Fecha de Creación: 11 mar 2019
* Descripcion:
* Ultimo Cambio:
* Fecha del Ultimo Cambio:
********************************************************/
package mx.gob.nl.genl.entity;

import java.util.ArrayList;
import java.util.List;

public class Portfolio {

	private List<Project> portfolio;
	
	public Portfolio() {
		portfolio = new ArrayList<Project>();
	}
	
	
	public List<Project> getPorfolio() {
		return portfolio;
	}
	
	public void addProject(Project project) {
		portfolio.add(project);
	}
	
}

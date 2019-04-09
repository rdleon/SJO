/******************************************************
* <h1>Gobierno del Estado de Nuevo León</h1>
* <h2>Sistema de Gestión de Obra Pública</h2>
*
* @author Neftalí López E.
* @version 1.0
* @since 2019
* Fecha de Creación: 30 mar 2019
* Descripcion:
* Ultimo Cambio:
* Fecha del Ultimo Cambio:
********************************************************/

package mx.gob.nl.genl.core.entity;

import com.fasterxml.jackson.annotation.JsonProperty;;

public class Project {
	
	@JsonProperty("project_id")
	private int id;
	
	@JsonProperty("name")
	private String name;
	
	@JsonProperty("dependency_Id")
	private int dependencyId;
	
	@JsonProperty("version")
	private int version;
	
	@JsonProperty("budget")
	private double budget;
	
	@JsonProperty("status")
	private int status;
	
	@JsonProperty("blocked")	
	private boolean blocked;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDependencyId() {
		return dependencyId;
	}

	public void setDependencyId(int dependencyId) {
		this.dependencyId = dependencyId;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public double getBudget() {
		return budget;
	}

	public void setBudget(double budget) {
		this.budget = budget;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public boolean isBlocked() {
		return blocked;
	}

	public void setBlocked(boolean blocked) {
		this.blocked = blocked;
	}
	
}

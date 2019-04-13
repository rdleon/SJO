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
package mx.gob.nl.genl.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProjectController {
	
	
	@RequestMapping("/")
	public String getIndex() throws Exception {
		System.out.println("Index Ok");
		return "index";
	}
	

	//@RequestMapping("/index2")
	@GetMapping("/index")
	public String getIndex2() throws Exception {
		System.out.println("Index Ok");
		return "index";
	}
	
	
	@GetMapping("/portfolio")
	public String getProjects() throws Exception {
		System.out.println("Portfolio Ok");
		return "portfolio";
	}

	@GetMapping("/dashboard")
	public String getDashboard() throws Exception {
		System.out.println("Portfolio Ok");
		return "dashboard";
	}

	
}

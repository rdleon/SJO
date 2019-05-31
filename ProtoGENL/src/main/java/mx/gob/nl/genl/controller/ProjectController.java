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
import org.springframework.web.servlet.ModelAndView;

@Controller("/")
public class ProjectController {
	
	
	@RequestMapping("/")
	public ModelAndView getIndex() throws Exception {
		System.out.println("Index Ok");
		ModelAndView mAndView = new ModelAndView();
        mAndView.setViewName("index");		
		return mAndView;
	}
	

	//@RequestMapping("/index2")
	@GetMapping("/index")
	public String getIndex2() throws Exception {
		System.out.println("Index Ok");
		return "index";
	}
	

	@GetMapping("/providers")
	public String getProviders() throws Exception {
		System.out.println("Proveedores Ok");
		return "providers";
	}

	@GetMapping("/contracts")
	public String getContracts() throws Exception {
		System.out.println("Contratos Ok");
		return "contracts";
	}
	
	
	@GetMapping("/projects")
	public String getProjects() throws Exception {
		System.out.println("projects Ok");
		return "projects";
	}

	@GetMapping("/follow_up")
	public String getFollowUp() throws Exception {
		System.out.println("Registro de Avance Ok");
		return "follow_up";
	}

	@GetMapping("/reports")
	public String getReports() throws Exception {
		System.out.println("Reportes Ok");
		return "reports";
	}
	
	@GetMapping("/dashboard")
	public String getDashboard() throws Exception {
		System.out.println("Portfolio Ok");
		return "dashboard";
	}

}

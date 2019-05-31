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
package mx.gob.nl.genl.init;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.DelegatingWebMvcConfiguration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.resource.PathResourceResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@EnableAutoConfiguration
//@ComponentScan("mx.gob.nl.genl.controller")
@ComponentScan(basePackages = {"mx.gob.nl.genl", "mx.gob.nl.genl.controller", "mx.gob.nl.genl.entity", "mx.gob.nl.genl.init"})
public class MvcConfiguration extends WebMvcConfigurerAdapter {
	
	public MvcConfiguration() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/*
	@Override
	protected void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
	    configurer.enable();
	}
	*/
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/fonts/**").addResourceLocations("/fonts/").setCachePeriod(3600).resourceChain(true).addResolver(new PathResourceResolver());
		registry.addResourceHandler("/images/**").addResourceLocations("/images/").setCachePeriod(3600).resourceChain(true).addResolver(new PathResourceResolver());
		registry.addResourceHandler("/script/**").addResourceLocations("/script/").setCachePeriod(3600).resourceChain(true).addResolver(new PathResourceResolver());
		registry.addResourceHandler("/styles/**").addResourceLocations("/styles/").setCachePeriod(3600).resourceChain(true).addResolver(new PathResourceResolver());
		registry.addResourceHandler("/mock/**").addResourceLocations("/mock/").setCachePeriod(3600).resourceChain(true).addResolver(new PathResourceResolver());
	}
	
    @Bean
	public InternalResourceViewResolver internalResourceViewResolver () {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("WEB-INF/jsp/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }
}

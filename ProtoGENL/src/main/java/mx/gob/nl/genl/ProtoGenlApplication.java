package mx.gob.nl.genl;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


//@SpringBootApplication(scanBasePackages="mx.gob.nl")
@SpringBootApplication
public class ProtoGenlApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(ProtoGenlApplication.class);
	}

	
	public static void main(String[] args) {
		SpringApplication.run(ProtoGenlApplication.class, args);
	}

	
}

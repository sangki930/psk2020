package com.psk.imageupload;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ImageUploaderApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(ImageUploaderApplication.class, args);
	}

}

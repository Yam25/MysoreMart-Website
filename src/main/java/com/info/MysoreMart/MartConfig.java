package com.info.MysoreMart;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages = "com.info.MysoreMart")
@EnableWebMvc
public class MartConfig  implements WebMvcConfigurer{
	 @Override 
	 public void addResourceHandlers(ResourceHandlerRegistry registry) {
	 registry.addResourceHandler("/js/**").addResourceLocations("/js/"); 
	 
	 registry.addResourceHandler("/css/**").addResourceLocations("/css/"); 
	 
	 registry.addResourceHandler("/images/**").addResourceLocations("/images/");
	 }
	 @Bean
	 public ViewResolver viewResolver() {
	     InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	     resolver.setPrefix("/WEB-INF/views/");
	     resolver.setSuffix(".jsp");
	     return resolver;
	 }

}

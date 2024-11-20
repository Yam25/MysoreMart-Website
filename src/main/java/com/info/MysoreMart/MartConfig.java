package com.info.MysoreMart;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.fasterxml.jackson.databind.ObjectMapper;

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

	    @Bean
	    public MappingJackson2HttpMessageConverter jacksonMessageConverter() {
	        return new MappingJackson2HttpMessageConverter(new ObjectMapper());
	    }

	    @Override
	    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
	        converters.add(jacksonMessageConverter()); 
	    }

}

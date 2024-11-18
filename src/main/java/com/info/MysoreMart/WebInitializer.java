package com.info.MysoreMart;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {


	@Override
	protected Class<?>[] getRootConfigClasses() {
		
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		
		return new Class[] {MartConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
	
		return new String[] {"/"}; //url pattern
	}
}

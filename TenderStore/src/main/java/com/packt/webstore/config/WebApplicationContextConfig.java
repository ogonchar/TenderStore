package com.packt.webstore.config;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletContextEvent;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.mysql.jdbc.Driver;

import rus.tend.store.security.MySimpleUrlAuthenticationSuccessHandler;

@Configuration
@EnableWebMvc
@ComponentScan("com.packt.webstore")
public class WebApplicationContextConfig extends WebMvcConfigurerAdapter {

     @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
 
    @Bean
    public InternalResourceViewResolver getInternalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setViewClass(JstlView.class);
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");

        return resolver;
    }
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
       registry.addResourceHandler("/img/**")
              .addResourceLocations("/resources/images/");
    }
    @Bean
    public MessageSource messageSource() { 
       ResourceBundleMessageSource resource = new ResourceBundleMessageSource();
       resource.setBasename("messages");
       return resource;    
    }
    @Bean(name = "validator")
    public LocalValidatorFactoryBean validator() {
       LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
       bean.setValidationMessageSource(messageSource());
       return bean;
    }
    
    @Override
    public Validator getValidator(){
       return validator();
    }
     
    @Bean 
    public MySimpleUrlAuthenticationSuccessHandler handler() {
    	return new MySimpleUrlAuthenticationSuccessHandler();
    }
    public final void contextDestroyed(ServletContextEvent sce) {
        // ... First close any background tasks which may be using the DB ...
        // ... Then close any DB connection pools ...

        // Now deregister JDBC drivers in this context's ClassLoader:
        // Get the webapp's ClassLoader
        ClassLoader cl = Thread.currentThread().getContextClassLoader();
        // Loop through all drivers
        Enumeration<java.sql.Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = (Driver) drivers.nextElement();
            if (driver.getClass().getClassLoader() == cl) {
                // This driver was registered by the webapp's ClassLoader, so deregister it:
                try {
                    DriverManager.deregisterDriver(driver);
                } catch (SQLException ex) {
                }
            } else {
                // driver was not registered by the webapp's ClassLoader and may be in use elsewhere
            }
        }
    }
    
}  




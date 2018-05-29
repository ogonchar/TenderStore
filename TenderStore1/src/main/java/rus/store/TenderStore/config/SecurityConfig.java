package rus.store.TenderStore.config;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import rus.store.TenderStore.HN.Application;
import rus.store.TenderStore.security.MySimpleUrlAuthenticationSuccessHandler;
import rus.store.TenderStore.security.MyUserDetailsService;
 
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	MySimpleUrlAuthenticationSuccessHandler handler;
	
    @Autowired
    private MyUserDetailsService userDetailsService;
    
    Logger log = Logger.getLogger(Application.class.getName());
   
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
  
       httpSecurity.formLogin().loginPage("/login")
                    .usernameParameter("userId")
                    .passwordParameter("password");
       
       httpSecurity.formLogin().defaultSuccessUrl("/tenders")
                    .failureUrl("/login?error");
       
       httpSecurity.logout().logoutSuccessUrl("/login?logout");
       
       httpSecurity.exceptionHandling().accessDeniedPage("/login?accessDenied");
       
       httpSecurity.authorizeRequests()
       				.antMatchers("/").permitAll()
       				.antMatchers("/**/tenders/**").authenticated();   
       
       httpSecurity.csrf().disable();
       httpSecurity.formLogin().successHandler(handler);
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	auth.userDetailsService(userDetailsService);
    }
}

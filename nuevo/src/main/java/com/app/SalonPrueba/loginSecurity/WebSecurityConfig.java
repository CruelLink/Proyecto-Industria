package com.app.SalonPrueba.loginSecurity;
//ANTES FUE LAS DEPENDENCIAS DE SECURITY EN pom.xml... PERO AHORA NECESITO QUE Security ME ACEPTE MIS HTML
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.app.SalonPrueba.service.UserDetailsServiceImpl;

@Configuration																			//LE DIGO QUE VA SER UN ARCHIVO O CLASE DE CONFIGURACION
@EnableWebSecurity																		//LE DIGO QUE QUIERO HABILITAR LA CONFIGURACION WEB DE LA SEGURIDAD (ADEMAS NOS VA PERMITIR CONFIGURARLA A MI ANTOJO)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{					//MI CLASE WebSecurityConfig VA HEREDAR DE WebSecurityConfigurerAdapter
	@Autowired
	AuthenticationSuccessHandler successHandler; 					//ESTA ES UNA CLASE EN EL QUE TRABAJO A QUE PAGINA ME VA LLEVAR SI INIICIO SESION COMO ADMIN O USER (LINEA 50 DE AQUI).. PERO OJO ESA CLASE LA CREO
	
																					//Necesario para evitar que la seguridad se aplique a los resources Como los css, imagenes y javascripts
  String[] resources = new String[]{
          "/include/**","/css/**","/icons/**","/img/**","/js/**","/layer/**" 
  };
	
  @Override
  protected void configure(HttpSecurity http) throws Exception {					//EN ESTE METODO LE DIRE QUE CONFIGURE Y QUE NO
      http																			//LE VOY A DECIR A http QUE:
          .authorizeRequests()														//QUIENES ESTAN AUTORIZADOS Y QUIENES NO Y DE QUE MANERA
	        .antMatchers(resources).permitAll()  									//QUE CUALQUIER TENGA ACCESO A LOS resources (MIS PLANTILLAS)
	        .antMatchers("/", "/login", "/usuario/crearUsuario", "/registroUser", "/vistaClientes", "/index").permitAll()		//EN EL login CUALQUIERA PUEDE ENTRAR (URL DESDE EL CONTROLLER)
	        .antMatchers("/admin/**").hasAuthority("ROLE_ADMIN")		//TODO LO QUE COMIENZE CON /admin* TIENE QUE TENER EL ROL DE 'ADMIN' OBLIGATORIAMENTE... OSEA ESAS PLANTILLAS (HTML) SON LOS ADMIN PODRAN ENTRAR
	        .antMatchers("/user/**").hasAuthority("ROLE_USER")			//TODO LO QUE COMIENZE CON /user* TIENE QUE TENER EL ROL 'USER' Y ASI TENDRAN ACCESO A LAS PLANTILLA DE DE USER (LOS HTML)... QUE LOS ADMIN TAMBIEN TENGAN ACCESO A ESOS HTML
            .anyRequest().authenticated()								//CUALQUIER OTRO Request (URL) QUE NO SEA NINGUNA DE LAS QUE ESPECIFIQUE ARRIBA (/admin* o /user*)... TIENEN QUE ESTAR AUTENTICADAS "authenticated()".... EJEMPLO menu.html
            															//-----------------------------------HASTA AQUI LA CONFIGURACION INICIAL--------------------------------------------------------------------
              
              .and()													//Y: LE DIGO QUE VOY A CONFIGURAR OTRA PARTE DE SEGURIDAD									
        
          .formLogin()	
          	  .permitAll()												//CUALQUIER PUEDE ACCEDER A ESA URL "/login"//AHORA QUIERO CONFIGURAR EL FORMULARIO DE LOGIN
              .loginPage("/login")										//LE DIGO QUE MI YO TENGO MI PAGINA DE LOGIN Y TIENE ESA URL (QUE EL PUSE EN EL CONTROLADOR)
              .usernameParameter("username")							//EL username PARA ENTRAR AL LOGIN SE LLAMA "username"___ EN E index.html LINEA 30 SE LO PONGO COMO (name="username")... CAMBIE DE HTML
              .passwordParameter("password")							//EL password PARA ENTRAR AL LOGIN SE LLAMA "password"___ EN E index.html LINEA 33 SE LO PONGO COMO (name="password")... CAMBIE DE HTML
              .failureUrl("/login")						//SI COMETO ERROR AL LOGEARME, ME VA A DEVOLVER A LA URL "/login" CON EL PARAMETRO ERROR. EN index.html LINEA 41___ (CAMBIE DE HTML)___ HAY UN CONFIGURACION CON EL PARAMETRO ERROR PARA QUE ME MUESTRE ESTOS ERRORES AL MOMENTO DE PONER MALOS LOS DATOS DEL LOGIN
              //.defaultSuccessUrl("/user/index")		//SI EXITOSAMENTE EL USUARIO SE LOGEA, ENTRARA A LA URL "/menu"_____ YA NO ME SIRVE ESTA FUNCION PORQUE QUIERO QUE ME LLEVE A PAGINAS DISTINTAS SI ES ADMIN O USER
              .successHandler(successHandler)			//SI INICIA SESION EXITOSAEMNTE ENTONCES ME LLEVARA A TAL PAGINA. ESTA CLASE LA CREE DONDE LE INDICO A QUE PAGINA ME DEBE DE LLEVAR SOY ADMIN O USER
              .permitAll()								//QUE PUEDA ACCEDER TODOS A LAS PAGINAS HTML QUE ESTAN DENTRO QUE TENGA user Y ADMIN... SI ES ADMIN LO VA A LLEVAR A SU PAGINA DE INICIO Y SI ES USER LO VA LLEVAR A LA PAGINA INICIO PARA USER___ (ESTE ROL LO OBTENGO DE MySQL)
             					
                     
              .and()		//Y: LE DIGO QUE VOY A CONFIGURAR OTRA PARTE DE SEGURIDAD
              
           .logout()										//AHORA QUIERO CONFIGURAR EL CERRAR CESION
              .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
              //.permitAll()								//CUALQUIERA PUEDE CERRAR CESION
              .logoutSuccessUrl("/login")					//AL CERRAR CESION ME VA A LLEVAR A ESTA URL "/login"_______EN index.html LINEA 43 AGREGO ESTE FUNCION
              
              .and()										//AHORA VOY A TRABAJAR LAS EXCEPCIONES
              
              .exceptionHandling()							//SI TUVIERA PAGINAS DE EXCEPCIONES ENTONCES UTILIZO LA EXCEPTION QUE ME PIDE PARAMETRO Y DIRECCIONO A LOS EXCEPCIONES QUE YO CREE
              .accessDeniedPage("/accesoDenegado");				  
  }
  
 
  
//CONFIGURAR EL INCRIPTADOR DE CONTRASEÑA PORQUE Security TRABAJA CON CONTRASEÑAS ENCRIPTADAS SI NO, NO PUEDO INICIAR SESION
  
  BCryptPasswordEncoder bCryptPasswordEncoder;																			//Crea el encriptador de contraseñas	
  @Bean
  public BCryptPasswordEncoder passwordEncoder() {
		bCryptPasswordEncoder = new BCryptPasswordEncoder(4);
		 return bCryptPasswordEncoder;
		/*El numero 4 representa que tan fuerte quiero la encriptacion. Se puede en un rango entre 4 y 31.
		  Si no pones un numero el programa utilizara uno aleatoriamente cada vez que inicies la aplicacion, por lo cual tus contrasenas encriptadas no funcionaran bien*/
  }
	
  
  //AQUI ESQUE VOY A IR A BUSCAR EL USUARIO EN LA BD. PERO DEBO CREAR UNA CLASE QUE ME IDENTIFIQUE EL USER, PASSWORD Y ROL (UserDetailsServiceImpl)
  @Autowired
  UserDetailsServiceImpl userDetailsService;
  
  //LA MANERA EN QUE VAMOS A AUTENTICAR LOS USURIOS
  //Registra el service para usuarios y el encriptador de contrasena
  @Autowired
  public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception { 

      // Setting Service to find User in the database.
      // And Setting PassswordEncoder
      auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());     	
  }
}
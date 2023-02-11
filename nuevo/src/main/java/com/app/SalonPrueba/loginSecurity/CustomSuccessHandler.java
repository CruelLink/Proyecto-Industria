package com.app.SalonPrueba.loginSecurity;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomSuccessHandler implements AuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,Authentication authentication) throws IOException, ServletException{
	Collection<?extends GrantedAuthority> authoritys = authentication.getAuthorities();
		
		String redireccionar = null;
		
		for(GrantedAuthority grantedAuthority:authoritys) {
			System.out.println("Tipo rol: " + grantedAuthority.getAuthority());
			if(grantedAuthority.getAuthority().equals("ROLE_USER")) {
				redireccionar = "/user/inicio";										///TODOS LOS URL QUE COMIENZE CON /user____________EJEMLPO /user/formulario
				break;			//TERMINO EL CICLO FOR
			}else if(grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
				redireccionar = "/admin/inicio";
				break;			//TERMINO EL CICLO FOr
			}
		}
		
		if(redireccionar==null) {	//SI EL ERROR ES NULO (SI NO EXISTE)
			throw new IllegalStateException();
		}
		
		new DefaultRedirectStrategy().sendRedirect(request, response, redireccionar);
		
	}
}

//ESTA CLASE ES PARA QUE CUANDO SE INICIE SESION ME LLEVE A LA PAGINA DE INICIO DE ADMIN SIN SOY ADMIN O A LA PAGINA DE INICIO DE USUARIO SI SOY USUARIO
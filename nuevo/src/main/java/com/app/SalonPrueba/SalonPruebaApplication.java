package com.app.SalonPrueba;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class SalonPruebaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SalonPruebaApplication.class, args);
		
		/*BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(4);
		
		System.out.println(bCryptPasswordEncoder.encode("1234"));*/
	}

}

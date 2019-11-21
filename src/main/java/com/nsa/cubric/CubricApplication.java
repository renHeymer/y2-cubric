package com.nsa.cubric;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication
@EnableOAuth2Sso
public class CubricApplication extends SpringBootServletInitializer
    {

        public static void main(String[] args) throws Exception
            {
                SpringApplication.run(CubricApplication.class, args);
            }

//        @Bean
//        @Profile("dev")
//        public FlywayMigrationStrategy cleanAndMigrateStrat()
//            {
//                return flyway ->
//                {
//                    flyway.clean();
//                    flyway.migrate();
//                };
//            }
    }

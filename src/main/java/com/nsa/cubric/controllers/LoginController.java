package com.nsa.cubric.controllers;

import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * MVC Controller
 */
@Controller
@EnableOAuth2Sso
@RequestMapping("/login")
public class LoginController
    {
        /**
         * @param modelAndView autowired
         * @return modelAndView autowired by Spring Boot with the view
         * set to index (home page)
         */
        @GetMapping()
        public ModelAndView login(ModelAndView modelAndView)
            {
                modelAndView.setViewName("index");
                return modelAndView;
            }
    }

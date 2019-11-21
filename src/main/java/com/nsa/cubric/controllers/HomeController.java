package com.nsa.cubric.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * MVC Controller
 */
@Controller
public class HomeController
    {
        /**
         * @param modelAndView autowired
         * @return ModelAndView of home page
         */
        @GetMapping("/home")
        public ModelAndView home(ModelAndView modelAndView)
            {
                return modelAndView;
            }
    }

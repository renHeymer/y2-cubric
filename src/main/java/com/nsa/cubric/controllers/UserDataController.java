package com.nsa.cubric.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * MVC Controller
 */
@Controller
@RequestMapping("/admin")
public class UserDataController
    {
        /**
         * @param modelAndView autowired
         * @return above modelAndView with the view set to be the
         * dashboard template
         */


        @GetMapping("/dashboard")
        public ModelAndView getDashboard(ModelAndView modelAndView)
            {
                modelAndView.setViewName("/new_templates/dashboard");
//                modelAndView.setViewName("test");
                return modelAndView;
            }

        /**
         * @param modelAndView autowired
         * @return above modelAndView with the view set to be the
         * live swipe data template
         */
        @GetMapping("/swipes/live")
        public ModelAndView getLiveSwipeData(ModelAndView modelAndView)
            {
                modelAndView.setViewName("swipe_data");

                return modelAndView;
            }
    }

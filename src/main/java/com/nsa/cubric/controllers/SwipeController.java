package com.nsa.cubric.controllers;


import com.nsa.cubric.model.User;
import com.nsa.cubric.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

/**
 * MVC Controller
 */
@Controller
public class SwipeController
    {

        @Autowired
        UserRepository userRepository;
        /**
         * @param modelAndView autowired
         * @return above modelAndView with the view set to be the
         * swipes template
         */
        @GetMapping("/swipe")
        public ModelAndView getSwipes(ModelAndView modelAndView)
            {
                modelAndView.setViewName("new_templates/swipe");
                return modelAndView;
            }

        /**
         * @param modelAndView autowired
         * @return above modelAndView with the view set to be the
         * practice template
         */
        @GetMapping("/practice")
        public ModelAndView getPractice(ModelAndView modelAndView, Authentication auth, Principal principal)
            {
                if(auth instanceof OAuth2Authentication)
                    {
                        System.out.println("Auth is instance of OAuth2");
                        String authDetails = ((OAuth2Authentication) auth).getUserAuthentication().getDetails().toString();
                        String username = principal.getName();
                        String email = authDetails.substring(authDetails.indexOf("email=") + 6, authDetails.indexOf("verified_email") -2);

                        User oauthUser = new User(username, email, "N/A", "N/A");
                        if(!userRepository.userExists(oauthUser))
                            {
                                System.out.println("Saving user...");
                                userRepository.save(oauthUser);
                            }
                    } else {
                    System.out.println("We don't think it's OAuth2");
                }
                modelAndView.setViewName("new_templates/practice");
                return modelAndView;
            }
    }

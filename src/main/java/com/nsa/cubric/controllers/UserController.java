package com.nsa.cubric.controllers;

import com.nsa.cubric.error.RegistrationError;
import com.nsa.cubric.model.User;
import com.nsa.cubric.services.SecurityService;
import com.nsa.cubric.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import java.security.Principal;

/**
 * MVC Controller
 */
@Controller
public class UserController {

    @Autowired
    IUserService userService;

    @Autowired
    SecurityService securityService;

    /**
     * @param modelAndView autowired
     * @return above modelAndView with the view set to be the
     * registration page
     */
    @GetMapping(value = "/registration")
    public ModelAndView registration(ModelAndView modelAndView) {
        modelAndView.addObject(new User());
        modelAndView.setViewName("registration");
        return modelAndView;
    }

    /**
     * @param user DTO - details of user requesting to register
     * @param modelAndView autowired
     * @return above modelAndView with the view set to be the
     * home page of registration is successful or set to the
     * registration page if unsuccessful
     */
    @PostMapping(value = "/registration")
    public ModelAndView handleRegistrationDetails(ModelAndView modelAndView,
                                                  @ModelAttribute User user) {

        System.out.println(user.getUsername());
        try {
            userService.validateUser(user);
            userService.save(user);
            securityService.autoLogin(user.getUsername(), user.getPassword());
        } catch (RegistrationError e)
            {
                System.out.println(e.getMessage());
                modelAndView.setViewName("registration");
                return modelAndView;
            }
        return new ModelAndView("home");
    }

    /**
     * @param modelAndView autowired
     * @return above modelAndView with the view set to be the
     * equality form page
     */
    @GetMapping("/equalityData")
    public ModelAndView equalityDataForm(ModelAndView modelAndView, Principal principal) {
        System.out.println(principal.getName() + " is logged in");
        modelAndView.setViewName("equality_details");
        return modelAndView;
    }

    /**
     * @param modelAndView autowired
     * @return above modelAndView with the view set to be the
     * forbidden error page (called when a user tries to access an admin resource
     * without admin credentials)
     */
    @GetMapping("/forbidden")
    public ModelAndView accessDenied(ModelAndView modelAndView)
        {
            modelAndView.setViewName("forbidden");
            return modelAndView;
        }
}
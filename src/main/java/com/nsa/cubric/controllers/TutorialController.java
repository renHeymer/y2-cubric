package com.nsa.cubric.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * MVC Controller
 */
@Controller
@RequestMapping("/tutorial")
public class TutorialController {

    /**
     * @param modelAndView autowired
     * @return above modelAndView with the view set to be the
     * tutorial page
     */
    @GetMapping("/start")
    public ModelAndView start(ModelAndView modelAndView)
    {
        modelAndView.setViewName("new_templates/tutorial");
        return modelAndView;
    }
}

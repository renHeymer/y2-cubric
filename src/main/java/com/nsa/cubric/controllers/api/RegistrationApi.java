package com.nsa.cubric.controllers.api;

import com.nsa.cubric.dto.UserEqualityDetails;
import com.nsa.cubric.error.RegistrationError;
import com.nsa.cubric.model.User;
import com.nsa.cubric.services.SecurityService;
import com.nsa.cubric.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.logging.Level;
import java.util.logging.Logger;

@RestController
public class RegistrationApi
    {
        @Autowired
        IUserService userService;

        @Autowired
        SecurityService securityService;

        private static final Logger LOGGER = Logger.getLogger(RegistrationApi.class.getName());

        @PostMapping("/api/registration")
        public ResponseEntity registerUser(@RequestParam("username") String username,
                                           @RequestParam("email") String email,
                                           @RequestParam("password") String password,
                                           @RequestParam("passwordConfirm") String passwordConfirm,
                                           HttpServletRequest request)
            {
                System.out.println("We made it to the post method handler");
                User user = new User(username,
                        email, password, passwordConfirm);

                HttpHeaders responseHeaders = new HttpHeaders();
                System.out.println(user.getUsername());

                try
                    {
                        userService.validateUser(user);
                        userService.save(user);
                        System.out.println("Should have saved user...");
                        try {
                            request.login(username, password);
                        } catch (ServletException e) {
                            LOGGER.log(Level.SEVERE, e.getMessage());
                        }
                        System.out.println("Should have auto-logged in");
                        responseHeaders.set("error", "none");
                        return new ResponseEntity<>("Registration Result", responseHeaders, HttpStatus.CREATED);
                    } catch (RegistrationError e)
                    {
                        responseHeaders.set("error", e.getMessage());
                        if (e.getCode() == 1)
                            {
                                return new ResponseEntity<>("Registration Result", responseHeaders, HttpStatus.CONFLICT);
                            } else if (e.getCode() == 2)
                            {
                                return new ResponseEntity<>("Registration Result", responseHeaders, HttpStatus.BAD_REQUEST);
                            } else
                            {
                                return new ResponseEntity<>("Registration Result", responseHeaders, HttpStatus.BAD_REQUEST);
                            }
                    }
            }

        @PostMapping("/api/equalityData")
        public ResponseEntity registerEqualityData(@RequestParam("gender") Integer gender,
                                                   @RequestParam("age") Integer age,
                                                   @RequestParam("religion") String religion,
                                                   @RequestParam("postCode") String postCode,
                                                   @RequestParam("nationality") String nationality,
                                                   @RequestParam("disability") String disability,
                                                   Principal principal)
            {
                System.out.println("We're in registerEqualityData()");
                HttpHeaders responseHeaders = new HttpHeaders();

                UserEqualityDetails details = new UserEqualityDetails(principal.getName(), gender,
                        disability, nationality, religion, age, postCode);
                userService.addUserEqualityDetails(details);

                responseHeaders.set("error", "none");
                return new ResponseEntity<>("Registration Result", responseHeaders, HttpStatus.CREATED);
            }
    }

package com.nsa.cubric.controllers.api;

import com.nsa.cubric.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping("/api/user")
public class UserApi
    {
        @Autowired
        IUserService userService;


        @PostMapping("/trainingCompleted")
        public ResponseEntity updateUsersTrainingStatus(Principal principal)
            {
                userService.updateTrainingStatusToComplete(principal.getName());
                HttpHeaders headers = new HttpHeaders();

                    return new ResponseEntity<>(headers, HttpStatus.OK );
            }
    }

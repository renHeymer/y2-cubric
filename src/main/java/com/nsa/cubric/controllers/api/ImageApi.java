package com.nsa.cubric.controllers.api;

import com.nsa.cubric.model.Scan;
import com.nsa.cubric.model.Swipe;
import com.nsa.cubric.services.SwipeService;
import com.nsa.cubric.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * API
 */
@RestController
@RequestMapping("/api/images")
public class ImageApi
    {
        @Autowired
        SwipeService swipeService;

        @Autowired
        IUserService userService;

        /**
         * @return  object with an array of image file paths and a batch number
         */
        @GetMapping("/newBatch")
        public HashMap<String, List<String>> getNewBatch(Principal principal)
            {
                return swipeService.getRepoBatch(principal.getName());
            }

        @GetMapping("/newBatch/training")
        public List<Scan> getNewTrainingBatch(Principal principal)
            {
                System.out.println(principal.getName() + " is requesting practice scans");
                return swipeService.getTrainingBatch(principal.getName());
            }

        @PostMapping("/answer")
        public ResponseEntity handleImageFeedback(@RequestParam("imageUri") String imageUri,
                                        @RequestParam("answer") Integer answer,
                                        Principal principal) {
            // Need to alter date object to include time
            Swipe swipe = new Swipe(imageUri, principal.getName(), answer, new Date());
            swipeService.insertSwipe(swipe);
            System.out.println("Image is: " + imageUri);
            HttpHeaders headers = new HttpHeaders();
            headers.add("success", "true");
            return new ResponseEntity("result", headers, HttpStatus.OK);
        }



        @PostMapping("/trainingAnswer")
        public ResponseEntity userTrainingAnswer(@RequestParam("imageUri") String imageUri,
                                                 @RequestParam("answer") Integer answer,
                                                 Principal principal)
            {
                System.out.println("Image is: " + imageUri);
                Swipe swipe = new Swipe(imageUri, principal.getName(), answer, new Date());
                swipeService.insertTrainingSwipe(swipe);


                HttpHeaders headers = new HttpHeaders();
                headers.add("success", "true");
                return new ResponseEntity("result", headers, HttpStatus.OK);
            }

        @PostMapping("/finishedTraining")
        public ResponseEntity userCompletedTraining(Principal principal)
            {
                userService.updateTrainingStatusToComplete(principal.getName());
                HttpHeaders headers = new HttpHeaders();
                headers.add("success", "true");
                return new ResponseEntity<>("result", headers, HttpStatus.OK);
            }


        @PostMapping("/finished")
        public String feedbackForm()
            {
                Boolean hasGivenFeedback = false;
                if(hasGivenFeedback)
                    {
                        return "feedbackGiven";
                    } else
                    {
                        return "feedbackNotGiven";
                    }
            }
    }






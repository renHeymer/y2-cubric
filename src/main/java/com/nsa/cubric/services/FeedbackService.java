package com.nsa.cubric.services;


import com.nsa.cubric.repositories.IFeedbackDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

/**
 * Gets Feedback data from the repository layer
 */
@Service
public class FeedbackService
    {

        @Autowired
        IFeedbackDataRepository feedbackDataRepository;

        public HashMap<String, Integer> getFeedback()
            {
                return feedbackDataRepository.allFeedbackAnswers();
            }
    }


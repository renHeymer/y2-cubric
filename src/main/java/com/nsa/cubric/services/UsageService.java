package com.nsa.cubric.services;

import com.nsa.cubric.dto.CrowdConfidence;
import com.nsa.cubric.repositories.IDataAnalysisRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * Gets Usage data (e.g. how many outliers there are) from the repository layer
 */
@Service
public class UsageService
    {
        @Autowired
        IDataAnalysisRepository dataAnalysisRepository;

        /**
         * @return a key value pair containing the total percentage of
         * swipes that were correct and incorrectly answered
         * overall users.
         */
        public HashMap<String, Double> getRatios()
            {
                return dataAnalysisRepository.RatioOfCorrectAndIncorrectAnswers();
            }

        /**
         * @return a key value pair containing the total number of active
         * users and the total number of outliers
         */
        public HashMap<String, Integer> getOutliers()
            {
                return dataAnalysisRepository.outliersAndGoodUsers();
            }

        /**
         * @return a key value pair containing the percentage of users that have
         * and haven't completed training
         */
        public HashMap<String, Integer> trainingCompletion()
            {
                return dataAnalysisRepository.trainingCompletion();
            }

        public List<CrowdConfidence> getCrowdConfidenceOnScans()
            {
                return dataAnalysisRepository.getCrowdConfidenceForScans();
            }
    }

package com.nsa.cubric.services;

import com.nsa.cubric.model.Scan;
import com.nsa.cubric.model.Swipe;
import com.nsa.cubric.repositories.IBatchRepository;
import com.nsa.cubric.repositories.ISwipeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * Gets Swipe data (e.g. a new batch of scans) from the repository layer
 */
@Service
public class SwipeService
    {
        @Autowired
        IBatchRepository batchRepository;

        @Autowired
        ISwipeRepository swipeRepository;

        /**
         * @param username of user requesting scans to swipe
         * @return a key value pair containing a List of scan IDs
         * and a list of folders that scan ID can ve found in
         * i.e. top, front and side view
         */
        public HashMap<String, List<String>> getRepoBatch(String username)
            {
                return batchRepository.getNewBatch(username);
            }

        /**
         * @param swipe DTO containing the users name, their answer and the scan ID
         */
        public void insertSwipe(Swipe swipe)
            {
                swipeRepository.insertSwipe(swipe);
            }

        /**
         * @param swipe same as above, only a training swipe needs to be inserted
         * into a separate table where there is no primary key constraint (scan ID and username)
         *  so that a user can take the practice round as many times as they wish
         */
        public void insertTrainingSwipe(Swipe swipe)
            {
                swipeRepository.insertTrainingSwipe(swipe);
            }

        /**
         * @param username of user requesting a training batch
         * @return a list of scans determined by a specific database query
         * so that a good mix of known good and known bad images are shown
         * throughout the training phase
         */
        public List<Scan> getTrainingBatch(String username)
            {
                return batchRepository.getNewTrainingBatch(username);
            }
    }

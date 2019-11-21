package com.nsa.cubric.repositories;

import com.nsa.cubric.dto.ScanData;
import com.nsa.cubric.model.Swipe;

import java.sql.ResultSet;
import java.util.List;

public interface ISwipeRepository
    {
        void insertSwipe(Swipe swipe);

        void insertTrainingSwipe(Swipe swipe);

        List<ScanData> getScanData();

        ResultSet getSwipeAndUserData();

        List<Swipe> getSwipesByUserName(String username);

        void deleteSwipesByUser(String username);
    }

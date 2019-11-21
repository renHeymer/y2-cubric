package com.nsa.cubric.repositories;

import com.nsa.cubric.dto.CrowdConfidence;

import java.util.HashMap;
import java.util.List;

public interface IDataAnalysisRepository
    {
        HashMap<String, Integer> outliersAndGoodUsers();

        HashMap<String, Double> RatioOfCorrectAndIncorrectAnswers();

        HashMap<String, Integer> trainingCompletion();

        List<CrowdConfidence> getCrowdConfidenceForScans();
    }

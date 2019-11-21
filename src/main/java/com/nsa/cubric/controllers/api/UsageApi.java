package com.nsa.cubric.controllers.api;

import com.nsa.cubric.dto.CrowdConfidence;
import com.nsa.cubric.services.UsageService;
import com.nsa.cubric.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/api/usageData")
public class UsageApi {

    @Autowired
    UsageService usageService;

    @Autowired
    IUserService userService;

//    @GetMapping("/usage")
//    public HashMap<String, Double> answersRatio()
//    {
//        return usageService.getRatios();
//    }

    @GetMapping("/answersRatio")
    public HashMap<String, Double> getRatios() { return usageService.getRatios();}

    @GetMapping("/outliers")
    public HashMap<String, Integer> getOutliers()
        {
            return usageService.getOutliers();
        }

    @GetMapping("/trainingStats")
    public HashMap<String, Integer> getTrainingStats()
        {
            return usageService.trainingCompletion();
        }

    @GetMapping("/completedTraining")
    public HashMap<String, Integer> getTrainingCompletion()
        {
            HashMap<String, Integer> trainingStats = usageService.trainingCompletion();
            return trainingStats;
        }

    @GetMapping("/user/trainingStatus")
    public HashMap<String, Boolean> getUsersTrainingStatus(Principal principal)
        {
            return userService.userHasCompletedTraining(principal.getName());
        }

    @GetMapping("/user/equalityDataStatus")
    public HashMap<String, Boolean> getUsersEqualityFormStatus(Principal principal)
        {
            System.out.println("We're in API for user equality form completion");
            return userService.userHasCompletedEqualityForm(principal.getName());
        }

    @GetMapping("/crowdConfidence")
    public List<CrowdConfidence> getCrowdConfidenceForScans()
        {
            return usageService.getCrowdConfidenceOnScans();
        }
}

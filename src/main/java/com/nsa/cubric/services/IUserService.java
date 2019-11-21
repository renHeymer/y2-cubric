package com.nsa.cubric.services;


import com.nsa.cubric.dto.UserEqualityDetails;
import com.nsa.cubric.error.RegistrationError;
import com.nsa.cubric.model.User;

import java.util.HashMap;

public interface IUserService
    {

    void save(User user) throws RegistrationError;

    User findByUsername(String username);

    void validateUser(User user) throws RegistrationError;

    void validateEqualityData(UserEqualityDetails details) throws RegistrationError;

    void addUserEqualityDetails(UserEqualityDetails details);

    void updateTrainingStatusToComplete(String username);

    HashMap<String, Boolean> userHasCompletedTraining(String username);

    HashMap<String, Boolean> userHasCompletedEqualityForm(String username);
}

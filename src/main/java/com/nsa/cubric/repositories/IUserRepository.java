package com.nsa.cubric.repositories;


import com.nsa.cubric.dto.UserEqualityDetails;
import com.nsa.cubric.error.RegistrationError;
import com.nsa.cubric.model.User;

import java.util.HashMap;

public interface IUserRepository {

    User findByUsername(String username);

    void save(User user) throws RegistrationError;

    Boolean hasGivenFeedback(String username);

    void addUserEqualityDetails(UserEqualityDetails details);

    void deleteUser(User user);

    void updateUsersTrainingStatus(String username);

    boolean hasCompletedTraining(String username);

    User loadByUsername(String username);

    HashMap<String, Boolean> userHasCompletedEqualityForm(String username);
}

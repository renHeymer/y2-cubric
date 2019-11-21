package com.nsa.cubric.services;


import com.nsa.cubric.dto.UserEqualityDetails;
import com.nsa.cubric.error.RegistrationError;
import com.nsa.cubric.model.User;
import com.nsa.cubric.repositories.IUserRepository;
import com.nsa.cubric.utils.UserDetailsValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;

/**
 * Gets User data from the repository layer and responds to the controller layer based on
 * the information in the repository layer
 */
@Service
public class UserService implements IUserService
    {

    @Autowired
    private IUserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

        /**
         * @param user
         * @throws RegistrationError if the repository layer has decided
         * a user has provided invalid registration details.
         */
    @Override
    public void save(User user) throws RegistrationError{
        // Encrypt password before inserting user to the database
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }


        /**
         * @param details to be added to the database
         */
    @Override
    public void addUserEqualityDetails(UserEqualityDetails details)
        {
            userRepository.addUserEqualityDetails(details);
        }

        /**
         * @param username of a user you want to retrieve
         * @return User
         */
    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

        /**
         * @param user
         * @throws RegistrationError if the repository layer has decided
         * a user has provided invalid registration details and provides an
         * appropriate message based on the verification error
         */
    @Override
    public void validateUser(User user) throws RegistrationError
        {
            if(!UserDetailsValidator.isValidEmail(user.getUserEmail()))
                {
                    throw new RegistrationError("Invalid email address", 2);
                }

            if(!UserDetailsValidator.isValidPassword(user.getPassword()))
                {
                    throw new RegistrationError("Invalid password. Password must me a minimum of 8 characters" +
                                                 "including at least one number and one letter.", 2);
                }

            if(!UserDetailsValidator.passwordsMatch(user.getPassword(), user.getPasswordConfirm()))
                {
                    throw new RegistrationError("Passwords must match", 2);
                }

            if(!UserDetailsValidator.isValidUsername(user.getUsername()))
                {
                    throw new RegistrationError("Invalid username. Username must not contain spaces.", 2);
                }
        }

        /**
         * @param details
         * @throws RegistrationError if the repository layer has decided
         * a user has provided invalid registration details and provides an appproporiate
         * error message.
         */
    @Override
    public void validateEqualityData(UserEqualityDetails details) throws RegistrationError
        {
            if(!UserDetailsValidator.isValidFirstHalfOfPostCode(details.getPostCode()))
                {
                    throw new RegistrationError("Invalid post code", 2);
                }

            if(!UserDetailsValidator.isValidAge(details.getAge()))
                {
                    throw new RegistrationError("Invalid age. Must be between 0 and 110", 2);
                }

        }

        /**
         * @param username of user you want to update
         *
         */
    @Override
    public void updateTrainingStatusToComplete(String username)
        {
            userRepository.updateUsersTrainingStatus(username);

        }

        /**
         * @param username of user
         * @return a key value pair containing true or false
         * depending on whether or not a user has completed training.
         * A HashMap was chosen over a plain Boolean for the purposes of
         * returning JSON to the client in our API layer
         */
    @Override
    public HashMap<String, Boolean> userHasCompletedTraining(String username)
        {
            HashMap<String, Boolean> results = new HashMap<>();
            results.put("hasCompletedTraining", userRepository.hasCompletedTraining(username));
            return results;
        }

        @Override
        public HashMap<String, Boolean> userHasCompletedEqualityForm(String username)
            {
                return userRepository.userHasCompletedEqualityForm(username);
            }
    }

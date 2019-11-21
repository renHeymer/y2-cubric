package com.nsa.cubric.services;

import com.nsa.cubric.model.User;
import com.nsa.cubric.repositories.IUserRepository;
import com.nsa.cubric.utils.MyUserPrincipal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


/**
 * Class that populates a UserDetails object with authentication details
 * for a user
 */
@Service
public class MyUserDetailsService implements UserDetailsService{


    @Autowired
    IUserRepository userRepository;

    /**
     * @param username of the person requesting authentication
     * @return an object that implements UserDetails
     *  Object is essentially a DTO holding username,
     *  password and authorities belonging to a user.
     *  See MyUserPrincipal in utils.
     */
    @Override
    public UserDetails loadUserByUsername(String username) {
        User user = userRepository.loadByUsername(username);
        System.out.println("Have loaded user");

        if (user == null) {
            throw new UsernameNotFoundException(username);
        }

        return new MyUserPrincipal(user);
    }
}

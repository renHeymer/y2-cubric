package com.nsa.cubric.utils;


import com.nsa.cubric.model.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Essentially a DTO class holding username,
 * password and authorities belonging to a user.
 * See MyUserPrincipal in utils.
 */
public class MyUserPrincipal implements UserDetails
    {

        private User user;

        public MyUserPrincipal(User user) {
            this.user = user;
        }

        /**
         * @return a collection of GrantedAuthorities specific
         * to a user's access rights
         */
        @Override
        public Collection<? extends GrantedAuthority> getAuthorities() {
            List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();

            for(String role : user.getRoles())
                {
                    list.add(new SimpleGrantedAuthority(role));
                }
            return list;
        }

        @Override
        public String getPassword() {
            return user.getPassword();
        }

        @Override
        public String getUsername() {
            return user.getUsername();
        }

        @Override
        public boolean isAccountNonExpired() {
            return true;
        }

        @Override
        public boolean isAccountNonLocked() {
            return true;
        }

        @Override
        public boolean isCredentialsNonExpired() {
            return true;
        }

        @Override
        public boolean isEnabled() {
            return true;
        }
    }

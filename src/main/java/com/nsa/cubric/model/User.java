package com.nsa.cubric.model;

import lombok.*;

import java.io.Serializable;
import java.util.List;

/**
 * DTO holding all details about a user
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class User implements Serializable
    {

        public User(String username)
            {
                this.username = username;
            }

        private Integer userID;


        @NonNull
        private String username;

        @NonNull
        private String userEmail;

        @NonNull
        private String password;

        @NonNull
        private String passwordConfirm;

        private Integer gender;

        private String disability;

        private String nationality;

        private String postCode;

        private Integer age;

        private String religion;

        private List<String> roles;
        private Integer completedTraining;
        private Integer discounted;


    }

package com.nsa.cubric.dto;

import lombok.AllArgsConstructor;;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO containing all data provided in a users equality form
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserEqualityDetails
    {
        private String username;

        private Integer gender;

        private String disability;

        private String nationality;

        private String religion;

        private Integer age;

        private String postCode;
    }

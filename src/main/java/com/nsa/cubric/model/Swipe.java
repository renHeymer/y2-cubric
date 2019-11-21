package com.nsa.cubric.model;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * DTO containing all details about a user's swipe on a certain scan
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Swipe
    {
        private String scanId;
        private String username;
        private Integer isGoodAnswer;
        private Date dateOfSwipe;

        @JsonCreator
        public Swipe(@JsonProperty("scanId") String scanId,
                     @JsonProperty("isGoodAnswer") Integer isGoodAnswer)
            {
                this.scanId = scanId;
                this.isGoodAnswer = isGoodAnswer;
            }
    }
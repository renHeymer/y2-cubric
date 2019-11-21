package com.nsa.cubric.dto;

import lombok.Data;

/**
 * DTO holding the scan name and the number of people that thought it was bad as well
 * ]as the number of people that thought it was good
 */
@Data
public class ScanData
    {
        private String imageUri;
        private Integer answerGood;
        private Integer answerBad;
    }

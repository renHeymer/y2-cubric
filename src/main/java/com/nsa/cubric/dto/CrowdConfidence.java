package com.nsa.cubric.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CrowdConfidence
    {
        private String scanFilePath;
        private int numOfSwipes;
        private int numBad;
        private int numGood;
    }

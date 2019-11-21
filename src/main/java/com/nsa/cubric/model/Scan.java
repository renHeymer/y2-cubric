package com.nsa.cubric.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * DTO holding all data about a scan
 */
@Data
@NoArgsConstructor
public class Scan
    {
        private String scan_id;
        private Integer isGoodScan;
        private List<String> folders;
    }

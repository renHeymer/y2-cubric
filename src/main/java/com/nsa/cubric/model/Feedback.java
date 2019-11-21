package com.nsa.cubric.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * DTO containing all fields provided by a user in their feedback form
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Feedback {

    private String username;
    private Date feedback_date;
    private int enjoyed;
    private int task_right_level;
    private String comments;
    private int recommend;

}


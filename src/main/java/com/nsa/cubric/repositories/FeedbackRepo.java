package com.nsa.cubric.repositories;

import com.nsa.cubric.model.Feedback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 * Repository class to insert and retrieve feedback data provided by a user
 */
@Repository
public class FeedbackRepo implements FeedbackInterface{

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * @param username
     * @param feedback_date
     * @param enjoyed
     * @param task_right_level
     * @param recommend
     * @param comments
     * @returns true if the database insert of a feedback row was successful
     */
    public int addFeedback (String username, Date feedback_date, int enjoyed, int task_right_level, int recommend, String comments) {
        return jdbcTemplate.update(" INSERT INTO feedback (username, feedback_date, enjoyed, task_right_level, comments, recommend) VALUES (?,?,?,?,?,?)",
                new Object []{username, feedback_date, enjoyed, task_right_level, comments, recommend});
    }

    /**
     * Hard coded manual test method
     * @return a list of feedback provided by a specific user
     */
    @Override
    public List<Feedback> findAllFeedback() {
        return jdbcTemplate.query("SELECT * FROM feedback WHERE username = 'loz'",
                new Object[]{},
                (rs,i) -> new Feedback (
                        rs.getString("username"),
                        rs.getDate("feedback_date"),
                        rs.getInt("enjoyed"),
                        rs.getInt("task_right_level"),
                        rs.getString("comments"),
                        rs.getInt("recommend")
                )
        );
    }

}

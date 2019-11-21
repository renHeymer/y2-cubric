package com.nsa.cubric.rowmappers;

import com.nsa.cubric.model.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Passed to JDBC query to map result set to dto
 */
public class UserRowMapper implements RowMapper<User> {

    @Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setPassword(rs.getString("password"));
        user.setUsername(rs.getString("username"));
        user.setUserEmail(rs.getString("user_email"));
        user.setCompletedTraining(rs.getInt("completed_training"));
        user.setDiscounted(rs.getInt("discounted"));
        return user;
    }
}

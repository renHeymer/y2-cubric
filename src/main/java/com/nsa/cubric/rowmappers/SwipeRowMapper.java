package com.nsa.cubric.rowmappers;


import com.nsa.cubric.model.Swipe;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Passed to JDBC query to map result set to dto
 */
public class SwipeRowMapper implements RowMapper<Swipe>
    {
        @Override
        public Swipe mapRow(ResultSet rs, int rowNum) throws SQLException
            {
                Swipe swipe = new Swipe(rs.getString("scan_id"),
                        rs.getString("username"),
                        rs.getInt("is_good_scan"),
                        rs.getDate("swipe_date"));
                return swipe;
            }
    }

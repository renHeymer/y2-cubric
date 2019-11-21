package com.nsa.cubric.repositories;

import com.nsa.cubric.dto.ScanData;
import com.nsa.cubric.model.Swipe;
import com.nsa.cubric.rowmappers.SwipeRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

@Repository
public class SwipeRepository implements ISwipeRepository
    {
        @Autowired
        JdbcTemplate jdbcTemplate;

        @Override
        public void insertSwipe(Swipe swipe)
            {
                String insertStatement = "INSERT INTO swipes (scan_id, username, is_good_scan, swipe_datetime) VALUES (?, ?, ?, ?) ";
                Object[] params = new Object[]{swipe.getScanId(), swipe.getUsername(), swipe.getIsGoodAnswer(), swipe.getDateOfSwipe()};
                int[] types = new int[]{Types.VARCHAR, Types.VARCHAR, Types.BOOLEAN, Types.DATE};
                jdbcTemplate.update(insertStatement, params, types);
            }

        @Override
        public List<ScanData> getScanData()
            {
                return null;
            }

        @Override
        public ResultSet getSwipeAndUserData()
            {
                try {
                    PreparedStatement ps = jdbcTemplate.getDataSource()
                            .getConnection()
                            .prepareStatement("SELECT s.scan_id, s.is_good_scan, s.swipe_datetime, \n" +
                                    "s.username, u.age, u.gender, \n" +
                                    "u.disability, u.disability_explanation, u.religion, u.post_code_fh\n" +
                                    "FROM swipes s LEFT JOIN user_equality u ON s.username=u.username");

                    Boolean hasResults = ps.execute();
                    System.out.println("Excel ResultSet has Results: " + hasResults);
                    ResultSet resultSet = ps.getResultSet();
                    return resultSet;
                } catch (SQLException e)
                    {
                        System.out.println(e.getMessage());
                        return null;
                    }
            }

        @Override
        public List<Swipe> getSwipesByUserName(String username)
            {
                List<Swipe> swipes = new ArrayList<>();
                String selectStatement = "SELECT * FROM swipes WHERE username = ?";
                Object[] params = new Object[]{username};
                int[] types = new int[]{Types.VARCHAR};
                jdbcTemplate.query(selectStatement,
                params,
                types,
                (rs, row) -> new Swipe(
                        rs.getString("scan_id"),
                        rs.getString("username"),
                        rs.getInt("is_good_scan"),
                        rs.getDate("swipe_datetime")))
                .forEach(entry -> swipes.add(entry));

                return swipes;
            }

        @Override
        public void deleteSwipesByUser(String username)
            {
                String selectStatement = "DELETE FROM swipes WHERE username = ?";
                Object[] params = new Object[]{username};
                int[] types = new int[]{Types.VARCHAR};
                jdbcTemplate.update(selectStatement, params, types);
            }

        @Override
        public void insertTrainingSwipe(Swipe swipe)
            {
                String insertStatement = "INSERT INTO training_swipes (username, scan_id, is_good_scan) VALUES (?, ?, ?) ";
                Object[] params = new Object[]{swipe.getUsername(), swipe.getScanId(), swipe.getIsGoodAnswer()};
                int[] types = new int[]{Types.VARCHAR, Types.VARCHAR, Types.INTEGER};
                jdbcTemplate.update(insertStatement, params, types);
            }
    }





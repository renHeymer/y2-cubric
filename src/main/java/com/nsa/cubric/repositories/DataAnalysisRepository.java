package com.nsa.cubric.repositories;

import com.nsa.cubric.dto.CrowdConfidence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@Repository
public class DataAnalysisRepository implements IDataAnalysisRepository
    {

        @Autowired
        private JdbcTemplate jdbcTemplate;

        @Autowired
        Environment environment;

        private static final Logger LOGGER = Logger.getLogger(DataAnalysisRepository.class.getName());

        @Override
        public HashMap<String, Integer> outliersAndGoodUsers()
            {
                HashMap<String, Integer> ratios = new HashMap();
                int totalActiveUsers = 0;
                int totalOutliers = 0;

                String sql = "{CALL updateDiscountedUsersLive(?,?)}";
                try {
                    Connection con = jdbcTemplate.getDataSource().getConnection();
                    CallableStatement cs = con.prepareCall(sql);
                    cs.registerOutParameter(1, Types.INTEGER);
                    cs.registerOutParameter(2, Types.INTEGER);

                    cs.execute();
                    totalActiveUsers = cs.getInt(1);
                    totalOutliers = cs.getInt(2);


                    ratios.put("totalActiveUsers", totalActiveUsers);
                    ratios.put("totalOutliers", totalOutliers);
                    con.close();
                } catch (SQLException e)
                    {
                        System.out.println("SQL Error:");
                        System.out.println("SQLSTATE: " + e.getSQLState());
                        System.out.println("SQL Error Code: " + e.getErrorCode());
                        System.out.println(e.getMessage());
                    }
                return ratios;
            }

        private String getAppropriateStoredProcedure()
            {
                if(Arrays.stream(environment.getActiveProfiles()).anyMatch(
                        env -> (env.equalsIgnoreCase("pilot")) ))
                    {
                        System.out.println("Going with pilot method");
                        return "{CALL updateDiscountedUsersPilot(?,?)}";
                    } else if (Arrays.stream(environment.getActiveProfiles()).anyMatch(
                        env -> (env.equalsIgnoreCase("dev")) ))
                    {
                        System.out.println("Going with production method");
                        return "{CALL updateDiscountedUsersLive(?,?)}";
                    }
                return null;
            }

        @Override
        public HashMap<String, Double> RatioOfCorrectAndIncorrectAnswers() {
                HashMap<String, Double> ratios = new HashMap();
                double percentageOfCorrectAnswers = 0;
                double percentageOfIncorrectAnswers = 0;

                String sql = "CALL answersRatio(?,?)";
                try {
                    Connection con = jdbcTemplate.getDataSource().getConnection();
                    CallableStatement cs = con.prepareCall(sql);
                    cs.registerOutParameter(1, Types.DOUBLE);
                    cs.registerOutParameter(2, Types.DOUBLE);

                    cs.execute();
                    percentageOfCorrectAnswers = cs.getDouble(1);
                    percentageOfIncorrectAnswers = cs.getDouble(2);


                    ratios.put("percentageOfCorrectAnswers", percentageOfCorrectAnswers);
                    ratios.put("percentageOfIncorrectAnswers", percentageOfIncorrectAnswers);
                    con.close();
                } catch (SQLException e)
                {
                    LOGGER.log(Level.SEVERE, e.getMessage());
                }
                return ratios;
        }

        /**
         * @return a key value pair of the number of users that have and
         * haven't completed training
         */
        public HashMap<String, Integer> trainingCompletion()
            {
                HashMap<String, Integer> trainingStats = new HashMap<>();
                try {
                    String query = "SELECT (SELECT COUNT(*) FROM users WHERE completed_training = 1) AS completedTraining," +
                            "(SELECT COUNT(*) FROM users WHERE completed_training = 0) AS notCompletedTraining";
                    PreparedStatement ps = jdbcTemplate.getDataSource().getConnection().prepareStatement(query);
                    ResultSet rs = ps.executeQuery();
                    while(rs.next())
                    {
                        trainingStats.put("completedTraining", rs.getInt("completedTraining"));
                        trainingStats.put("notCompletedTraining", rs.getInt("notCompletedTraining"));
                        System.out.println(trainingStats.get("completedTraining") + " have completed training");
                    }
                } catch (SQLException e)
                    {
                        LOGGER.log(Level.SEVERE, e.getMessage());
                    }
                return trainingStats;
            }

        @Override
        public List<CrowdConfidence> getCrowdConfidenceForScans()
            {
                List<CrowdConfidence> result = new ArrayList<>();
                try {
                    String query = "SELECT * FROM userconfidence";
                    PreparedStatement ps = jdbcTemplate.getDataSource().getConnection().prepareStatement(query);
                    ResultSet rs = ps.executeQuery();
                    while(rs.next())
                        {
                            CrowdConfidence crowdConfidence = new CrowdConfidence(
                                    rs.getString("scan_id"),
                                    rs.getInt("totalSwipes"),
                                    rs.getInt("answerGood"),
                                    rs.getInt("answerBad"));
                            result.add(crowdConfidence);

                        }
                } catch (SQLException e)
                    {
                        LOGGER.log(Level.SEVERE, e.getMessage());
                    }
                return result;
            }
    }


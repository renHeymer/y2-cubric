package com.nsa.cubric.repositories;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Repository class that retrieves all feedback data and
 * formats it into a HashMap ready for the API layer to return
 * as JSON
 */
@Repository
public class FeedbackDataRepository implements IFeedbackDataRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final Logger LOGGER = Logger.getLogger(FeedbackDataRepository.class.getName());

    /**
     * @return A HashMap containing user feedback data e.g. how many users rated
     * 'enjoyed' as 5, or 4 etc.
     */
    @Override
    public HashMap<String, Integer> allFeedbackAnswers() {
        HashMap<String, Integer> answers = new HashMap<>();
        Integer result = null;
        Integer result2 = null;
        Integer result3 = null;
        Integer result4 = null;
        Integer result5 = null;
        Integer result6 = null;
        Integer result7 = null;
        Integer result8 = null;
        Integer result9 = null;
        Integer result10 = null;
        Integer result11 = null;
        Integer result12 = null;
        Integer result13 = null;
        Integer result14 = null;
        Integer result15 = null;

        String feedbackSQL = "{CALL getFeedbackReport(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
        try {
            Connection con = jdbcTemplate.getDataSource().getConnection();
            CallableStatement cs = con.prepareCall(feedbackSQL);
            registerOutParams(cs,Types.INTEGER, 15);

            cs.execute();
            result = cs.getInt(1);
            result2 = cs.getInt(2);
            result3 = cs.getInt(3);
            result4 = cs.getInt(4);
            result5 = cs.getInt(5);
            result6 = cs.getInt(6);
            result7 = cs.getInt(7);
            result8 = cs.getInt(8);
            result9 = cs.getInt(9);
            result10 = cs.getInt(10);
            result11 = cs.getInt(11);
            result12 = cs.getInt(12);
            result13 = cs.getInt(13);
            result14 = cs.getInt(14);
            result15 = cs.getInt(15);

            System.out.println(result);
            System.out.println(result2);
            System.out.println(result3);
            System.out.println(result4);
            System.out.println(result5);
            System.out.println(result6);
            System.out.println(result7);
            System.out.println(result8);
            System.out.println(result9);
            System.out.println(result10);
            System.out.println(result11);
            System.out.println(result12);
            System.out.println(result13);
            System.out.println(result14);
            System.out.println(result15);


            answers.put("Enjoyed (1)", result);
            answers.put("Enjoyed (2)", result2);
            answers.put("Enjoyed (3)", result3);
            answers.put("Enjoyed (4)", result4);
            answers.put("Enjoyed (5)", result5);

            answers.put("Difficulty (1)", result6);
            answers.put("Difficulty (2)", result7);
            answers.put("Difficulty (3)", result8);
            answers.put("Difficulty (4)", result9);
            answers.put("Difficulty (5)", result10);

            answers.put("Recommend (1)", result11);
            answers.put("Recommend (2)", result12);
            answers.put("Recommend (3)", result13);
            answers.put("Recommend (4)", result14);
            answers.put("Recommend (5)", result15);
            con.close();

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE , e.getMessage());
        }
        return answers;
    }

    /**
     * @param cs
     * @param type
     * @param numOfParams
     *
     * Util method to register a given number of out parameters to a given
     * CallableStatement, all of a given type
     */
    private void registerOutParams(CallableStatement cs, Integer type, int numOfParams){
        try {
            for(int i = 1; i < numOfParams; i++)
            {
                cs.registerOutParameter(i, type);
            }
        } catch (SQLException e)
        {
            LOGGER.log(Level.SEVERE , e.getMessage());
        }
    }
}

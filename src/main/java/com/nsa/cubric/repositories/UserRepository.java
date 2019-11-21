package com.nsa.cubric.repositories;

import com.nsa.cubric.dto.UserEqualityDetails;
import com.nsa.cubric.error.RegistrationError;
import com.nsa.cubric.model.User;
import com.nsa.cubric.rowmappers.UserRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Repository
public class UserRepository implements IUserRepository
    {

        @Autowired
        JdbcTemplate jdbcTemplate;

        @Override
        public User findByUsername(String username)
            {
                String sql = "SELECT * FROM users WHERE username = ?";
                User user = (User) jdbcTemplate.queryForObject(
                        sql, new Object[]{username}, new UserRowMapper());
                if(user == null)
                    {
                        setRole(user);
                    }
                return user;
            }

        /**
         * @param username
         * @return
         */
        @Override
        public User loadByUsername(String username)
            {
                List<User> users = jdbcTemplate.query("SELECT * FROM users WHERE username = ?",
                        preparedStatement -> preparedStatement.setString(1, username),
                        new UserRowMapper());
                if (users.size() > 0)
                    {
                        User user = users.get(0);
                        setRole(user);
                        return user;
                    } else
                    {
                        return null;
                    }
            }

        @Override
        public void deleteUser(User user)
            {
                String deleteFromRoles = "DELETE FROM user_roles WHERE username = ?";
                Object[] params = new Object[]{user.getUsername()};
                int[] types = new int[]{Types.VARCHAR};
                jdbcTemplate.update(deleteFromRoles, params, types);

                String deleteFromUsers = "DELETE FROM users WHERE username = ?";
                jdbcTemplate.update(deleteFromUsers, params, types);
            }

        public List<User> usersByUsername(String username)
            {
                List<User> results = new ArrayList<>();
                String selectWhere = "SELECT * FROM users WHERE username = ?";
                Object[] params = new Object[]{username};
                int[] types = new int[]{Types.VARCHAR};


                jdbcTemplate.query(selectWhere,
                        params,
                        types,
                        (rs, row) -> new User(
                                rs.getString("username")))
                        .forEach(entry -> results.add(entry));

                return results;
            }


        private List<User> findByEmail(String email)
            {

                List<User> results = new ArrayList<>();
                String selectWhere = "SELECT * FROM users WHERE user_email = ?";
                Object[] params = new Object[]{email};
                int[] types = new int[]{Types.VARCHAR};


                jdbcTemplate.query(selectWhere,
                        params,
                        types,
                        (rs, row) -> new User(
                                rs.getString("username")))
                        .forEach(entry -> results.add(entry));

                return results;
            }

        private void setRole(User user)
            {
                List<String> userRoles = new ArrayList<>();
                try
                    {
                        PreparedStatement ps = jdbcTemplate.getDataSource()
                                .getConnection()
                                .prepareStatement("SELECT role FROM user_roles WHERE username = ?");
                        ps.setString(1, user.getUsername());
                        ResultSet rs = ps.executeQuery();
                        while(rs.next())
                            {
                                userRoles.add(rs.getString("role"));
                            }
                        user.setRoles(userRoles);
                    } catch (SQLException e)
                    {

                    }

            }

        @Override
        public void save(User user)
            {
                if(!userExists(user))
                    {

                        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy/hh:mm:ss");
                        String timeStamp = dateFormat.format(System.currentTimeMillis());
                        System.out.println("We are saving: " + user.getUsername());
                        String insertStatement = "INSERT INTO users (username, password, user_email, time_created) VALUES (?, ?, ?, ?) ";
                        Object[] params = new Object[]{user.getUsername(), user.getPassword(), user.getUserEmail(), timeStamp};
                        int[] types = new int[]{Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR};
                        jdbcTemplate.update(insertStatement, params, types);

                        String authoritiesStatement = "INSERT INTO user_roles (username, role) VALUES (?, ?) ";
                        Object[] authParams = new Object[]{user.getUsername(), "ROLE_USER"};
                        int[] authTypes = new int[]{
                                Types.VARCHAR, Types.VARCHAR};
                        jdbcTemplate.update(authoritiesStatement, authParams, authTypes);
                    }
            }

        public Boolean userExists(User user)
            {
                try
                    {
                        if (loadByUsername(user.getUsername()).getUsername().isEmpty())
                            {
                                return false;
                            }
                        System.out.println(usersByUsername(user.getUsername()).get(0).getUsername());
                        System.out.println(usersByUsername(user.getUsername()).size());
                        return true;
                    } catch (NullPointerException e)
                    {
                        return false;
                    }
            }

        public Boolean emailExists(User user)
            {
                try
                    {
                        List<User> fetchedUsers = findByEmail(user.getUserEmail());
                        if (fetchedUsers.isEmpty())
                            {
                                return false;
                            }
                        return true;
                    } catch (NullPointerException e)
                    {
                        return false;

                    }
            }

        @Override
        public Boolean hasGivenFeedback(String username)
            {
                return false;

            }

        @Override
        public void addUserEqualityDetails(UserEqualityDetails details)
            {
                Integer hasDisability = 0;
                if (details.getDisability() != null)
                    {
                        hasDisability = 1;
                    }
                String equalityStatement = "INSERT INTO user_equality (username, gender, age, disability, disability_explanation, post_code_fh, religion) VALUES (?, ?, ?, ?, ?, ?, ?) ";
                Object[] equalityParams = new Object[]{details.getUsername(), details.getGender(), details.getAge(), hasDisability, details.getDisability(), details.getPostCode(), details.getReligion()};
                int[] equalityTypes = new int[]{Types.VARCHAR, Types.INTEGER, Types.INTEGER, Types.TINYINT, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR};
                jdbcTemplate.update(equalityStatement, equalityParams, equalityTypes);
            }

        @Override
        public void updateUsersTrainingStatus(String username)
            {
                String sql = "UPDATE users SET completed_training = 1 WHERE username = ?";
                Object[] params = new Object[]{username};
                int[] types = new int[]{Types.VARCHAR};
                jdbcTemplate.update(sql, params, types);
            }

        @Override
        public boolean hasCompletedTraining(String username)
            {
                String selectWhere = "SELECT completed_training FROM users WHERE username = ?";
                try
                    {
                        PreparedStatement ps = jdbcTemplate.getDataSource().getConnection().prepareStatement(selectWhere);
                        ps.setString(1, username);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next())
                            {
                                if (rs.getInt("completed_training") == 1)
                                    {
                                        return true;
                                    } else
                                    {
                                        return false;
                                    }
                            }
                    } catch (SQLException e)
                    {

                    }
                return false;
            }

        @Override
        public HashMap<String, Boolean> userHasCompletedEqualityForm(String username)
            {
                HashMap<String, Boolean> results = new HashMap<>();
                results.put("hasCompletedEqualityForm", false);

                String selectWhere = "SELECT * FROM user_equality WHERE username = ?";
                try
                    {
                        PreparedStatement ps = jdbcTemplate.getDataSource().getConnection().prepareStatement(selectWhere);
                        ps.setString(1, username);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next())
                            {
                                results.put("hasCompletedEqualityForm", true);
                            }
                    } catch (SQLException e)
                    {
                        System.out.println(e.getMessage());
                    }
                return results;
            }
    }





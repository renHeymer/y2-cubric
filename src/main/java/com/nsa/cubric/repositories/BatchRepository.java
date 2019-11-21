package com.nsa.cubric.repositories;

import com.nsa.cubric.model.Scan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Repository class that retrieves scans for users
 */
@Repository
public class BatchRepository implements IBatchRepository
    {
        @Autowired
        private JdbcTemplate jdbcTemplate;

        private static final Logger LOGGER = Logger.getLogger(BatchRepository.class.getName());

        /**
         * @return a List of all folder paths containing
         * a scan i.e. for any scan_id, that scan
         * id will be present in all folders, with one showing the top view,
         * another the front and another the side
         */
        @Override
        public List<String> getScanFolders()
            {
                List<String> results = new ArrayList<>();
                String select = "SELECT * FROM image_folders";

                jdbcTemplate.query(select,
                        (rs, row) ->
                                rs.getString("folder_prefix"))
                        .forEach(entry -> results.add(entry));

                return results;
            }

        /**
         * @param username of user requesting a new batch of scans
         * @return a HashMap containg a List of scan ID (JPG names) and a
         * list of all folders that scan ID can be found in (top, front and side views)
         */
        @Override
        public HashMap<String, List<String>> getNewBatch(String username)
            {
                return getBatch("{CALL getNewBatchForUser(?)}", username);
            }

        /**
         * @param username of user requesting the training batch
         * @return a specific List of scans to be used for training purposes
         * to ensure that there is a good balance of bad and good images
         */
        @Override
        public List<Scan> getNewTrainingBatch(String username)
            {
                List<Scan> scans = new ArrayList<>();
                List<String> folders = getScanFolders();

                try {
                    Connection con = jdbcTemplate.getDataSource().getConnection();
                    CallableStatement cs = con.prepareCall("{CALL getTrainingBatch(?)}");
                    cs.setString(1, username);

                    Boolean hasResults = cs.execute();
                    System.out.println("Has results: " + hasResults);
                    if(hasResults){
                        ResultSet rs = cs.getResultSet();
                        while(rs.next()){
                            Scan scan = new Scan();
                            scan.setFolders(folders);
                            scan.setScan_id(rs.getString("scan_id"));
                            scan.setIsGoodScan(rs.getInt("correct_answer"));
                            System.out.println(rs.getString("scan_id"));
                            scans.add(scan);
                        }
                    }
                    con.close();
                } catch (SQLException e)
                    {

                    }
                Collections.shuffle(scans);
                System.out.println(scans.size());
                return scans;
            }

        /**
         * @param sql statement calling a stored procedure
         * @param username of user requesting a new batch
         * @return
         */
        // Reference: http://www.herongyang.com/JDBC/MySQL-CallableStatement-Multiple-ResulSet.html
        public HashMap<String, List<String>> getBatch(String sql, String username)
            {
                HashMap<String, List<String>>  scanBatch = new HashMap<>();
                List<String> imageURIs = new ArrayList<>();
                // Get all folder paths and place them in the HashMap to return
                List<String> folderPrefixes = getScanFolders();
                scanBatch.put("folders", folderPrefixes);
                System.out.println("Number of folder prefixes: " + folderPrefixes.size());

                try {
                    Connection con = jdbcTemplate.getDataSource().getConnection();
                    CallableStatement cs = con.prepareCall(sql);
                    cs.setString(1, username);

                    boolean hasResults = cs.execute();

                    // If the query has given results, loop over all rows and
                    // add the scan_id to a list
                    if(hasResults){
                        ResultSet rs = cs.getResultSet();
                        while(rs.next()){
                            imageURIs.add(rs.getString("scan_id"));
                            System.out.println(rs.getString("scan_id"));
                        }
                        Collections.shuffle(imageURIs);
                        // Once all scan IDs have been collected, put them in the HashMap to return
                        scanBatch.put("images", imageURIs);
                    }
                    con.close();
                } catch (SQLException e)
                    {
                        LOGGER.log(Level.SEVERE, e.getMessage());
                    }
                System.out.println("Number of images added: " + imageURIs.size());
                return scanBatch;
            }
    }
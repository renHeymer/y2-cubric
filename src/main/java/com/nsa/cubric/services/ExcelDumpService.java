package com.nsa.cubric.services;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.nsa.cubric.repositories.SwipeRepository;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;;
import org.springframework.stereotype.Service;

// Reference: http://findnerd.com/list/view/Writing-data-from-MySql-table-to-Excel-using-Java/19682/
// I have taken code from the above source and refactored it

/**
 * Service that writes swipe data connected to a users equality data to an excel sheet
 */
@Service
public class ExcelDumpService {

    @Autowired
    SwipeRepository swipeRepository;

    private static final Logger LOGGER = Logger.getLogger(ExcelDumpService.class.getName());

    /**
     * @return file path of newly created excel file
     *
     * Dumps query data into excel file
     */
    public String dumpData()
        {
            try {
                // Call result set from database
                ResultSet resultSet = swipeRepository.getSwipeAndUserData();
                XSSFWorkbook workbook = createWorkBook();
                XSSFSheet spreadsheet = createSpreadsheet(workbook, "swipe_data");
                XSSFRow row = spreadsheet.createRow(1);
                populateHeaderCell(row);

                int i = 2;
                while (resultSet.next()) {
                    row = spreadsheet.createRow(i);
                    populateDataCells(row, resultSet);
                    i++;
                }
                return writeWorkbookToFile(workbook);
            }  catch (SQLException e) {
                System.out.println(e);
                System.out.println(e.getMessage());
                return null;
            }
        }

    // Create and  return a XSSFSheet object
    private XSSFSheet createSpreadsheet(XSSFWorkbook workbook, String spreadsheetName)
        {
            XSSFSheet spreadsheet = workbook.createSheet(spreadsheetName);
            return spreadsheet;
        }

    // Create and return a XSSFWorkbook object
    private XSSFWorkbook createWorkBook()
        {
            return new XSSFWorkbook();
        }

    // Populate header row
    private void populateHeaderCell(XSSFRow row)
        {
            XSSFCell cell;
            cell = row.createCell(0);
            cell.setCellValue("Scan ID");
            cell = row.createCell(1);
            cell.setCellValue("User Swipe");
            cell = row.createCell(2);
            cell.setCellValue("Swipe Date");
            cell = row.createCell(3);
            cell.setCellValue("Username");
            cell = row.createCell(4);
            cell.setCellValue("Age");
            cell = row.createCell(5);
            cell.setCellValue("Gender");
            cell = row.createCell(6);
            cell.setCellValue("Disability");
            cell = row.createCell(7);
            cell.setCellValue("Disability Explanation");
            cell = row.createCell(8);
            cell.setCellValue("Religion");
            cell = row.createCell(9);
            cell.setCellValue("Post Code");
        }

    // Populate file with database results
    private void populateDataCells(XSSFRow row, ResultSet rs)
        {
            try {
                XSSFCell cell;
                cell = row.createCell(0);
                cell.setCellValue(rs.getString("scan_id"));
                cell = row.createCell(1);
                cell.setCellValue(rs.getString("is_good_scan"));
                cell = row.createCell(2);
                cell.setCellValue(rs.getDate("swipe_datetime"));
                cell = row.createCell(3);
                cell.setCellValue(rs.getString("username"));
                cell = row.createCell(4);
                cell.setCellValue(rs.getInt("age"));
                cell = row.createCell(5);
                cell.setCellValue(rs.getInt("gender"));
                cell = row.createCell(6);
                cell.setCellValue(rs.getInt("disability"));
                cell = row.createCell(7);
                cell.setCellValue(rs.getString("disability_explanation"));
                cell = row.createCell(8);
                cell.setCellValue(rs.getString("religion"));
                cell = row.createCell(9);
                cell.setCellValue(rs.getString("post_code_fh"));
            } catch (SQLException e)
                {
                    System.out.println(e.getMessage());
                }

        }

    // Write workbook to a file and return said file path
    private String writeWorkbookToFile(XSSFWorkbook workbook)
        {
            try {
                String resourcePrefix = "src/main/resources/static";
                String resourceSuffix = "/excel/swipe_data.xlsx";
                Path path = Paths.get( resourcePrefix + resourceSuffix);
                FileOutputStream out = new FileOutputStream(path.toFile());
                workbook.write(out);
                out.close();
                LOGGER.log(Level.INFO, "File Successfully created");
                return Paths.get(resourceSuffix).toString();
            } catch (IOException e)
                {
                    LOGGER.log(Level.SEVERE, e.getMessage());
                    return null;
                }
        }
}
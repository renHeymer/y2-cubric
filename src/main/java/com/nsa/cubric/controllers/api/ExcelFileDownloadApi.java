package com.nsa.cubric.controllers.api;

import com.nsa.cubric.services.ExcelDumpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * API that responds to a clients request to export swipe data to an Excel file
 * and returns the file path the client needs in order to download it into the browser
 */
@RestController
public class ExcelFileDownloadApi
    {
        @Autowired
        ExcelDumpService excelDumpService;

        @GetMapping("/admin/api/swipes/excel")
        public ResponseEntity getFilePathForExcelFile()
            {
                String filePath = excelDumpService.dumpData();
                HttpHeaders responseHeaders = new HttpHeaders();
                responseHeaders.set("excelFilePath", excelDumpService.dumpData());
                if (filePath.isEmpty())
                    {
                        return new ResponseEntity<>("response", responseHeaders, HttpStatus.NO_CONTENT);
                    } else
                    {
                        return new ResponseEntity<>("response", responseHeaders, HttpStatus.OK);
                    }
            }
    }

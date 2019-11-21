package com.nsa.cubric.repositories;


import com.nsa.cubric.model.Scan;

import java.util.HashMap;
import java.util.List;

public interface IBatchRepository
    {
        HashMap<String, List<String>> getNewBatch(String username);

        List<Scan> getNewTrainingBatch(String username);

        List<String> getScanFolders();

    }

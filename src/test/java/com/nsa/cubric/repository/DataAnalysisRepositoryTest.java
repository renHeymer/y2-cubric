package com.nsa.cubric.repository;


import com.nsa.cubric.CubricApplication;
import com.nsa.cubric.repositories.DataAnalysisRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.data.jdbc.AutoConfigureDataJdbc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertFalse;

@DirtiesContext
@ContextConfiguration(classes = CubricApplication.class)
@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles("dev")
@AutoConfigureDataJdbc
public class DataAnalysisRepositoryTest
    {
        @Autowired
        DataAnalysisRepository repository;

        @Test
        public void shouldReturnOutliersAndGoodUsers()
            {
                assertFalse(repository.outliersAndGoodUsers().isEmpty());
            }

        @Test
        public void shouldReturnRatioOfCorrectAndIncorrectAnswers()
            {
                assertFalse(repository.RatioOfCorrectAndIncorrectAnswers().isEmpty());
            }

        @Test
        public void shouldReturnNumberOfUsersCompletedAndNotCompletedTraining()
            {
                assertFalse(repository.trainingCompletion().isEmpty());
            }
    }



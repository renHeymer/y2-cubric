//package com.nsa.cubric.controller;
//
//import com.nsa.cubric.CubricApplication;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.autoconfigure.data.jdbc.AutoConfigureDataJdbc;
//import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.security.test.context.support.WithMockUser;
//import org.springframework.test.annotation.DirtiesContext;
//import org.springframework.test.context.ActiveProfiles;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringRunner;
//import org.springframework.test.web.servlet.MockMvc;
//
//import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
//
//@DirtiesContext
//@ContextConfiguration(classes = CubricApplication.class)
//@RunWith(SpringRunner.class)
//@SpringBootTest()
//@AutoConfigureMockMvc
//@ActiveProfiles("dev")
//@AutoConfigureDataJdbc
//public class TutorialControllerTest
//    {
//        @Autowired
//        private MockMvc mockMvc;
//
//
//        @Test
//        @WithMockUser(roles = "USER")
//        public void shouldReturnTutorialPage() throws Exception
//            {
//                this.mockMvc
//                        .perform(get("/tutorial/start"))
//                        .andExpect(status()
//                                .isOk())
//                        .andExpect(view().name("tutorial"));
//            }
//    }

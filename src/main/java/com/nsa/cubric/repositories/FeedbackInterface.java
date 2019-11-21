package com.nsa.cubric.repositories;

import com.nsa.cubric.model.Feedback;

import java.util.List;

public interface FeedbackInterface {

    List<Feedback> findAllFeedback();
}

package com.example.demo.controller;

import com.example.demo.dto.QuestionDto;
import com.example.demo.service.QuestionService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/questions")
public class QuestionController {

    private final QuestionService service;

    public QuestionController(QuestionService service) {
        this.service = service;
    }

    // GET /questions/{symptomId}
    @GetMapping("/{symptomId}")
    public List<QuestionDto> getQuestions(@PathVariable Long symptomId) {
        return service.getQuestionsForSymptom(symptomId);
    }
}

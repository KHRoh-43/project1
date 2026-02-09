package com.example.demo.service;

import com.example.demo.domain.Symptom;
import com.example.demo.dto.QuestionDto;
import com.example.demo.repository.QuestionRepository;
import com.example.demo.repository.SymptomRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionService {

    private final QuestionRepository questionRepository;
    private final SymptomRepository symptomRepository;

    public QuestionService(QuestionRepository questionRepository,
                           SymptomRepository symptomRepository){
        this.questionRepository = questionRepository;
        this.symptomRepository = symptomRepository;
    }
    public List<QuestionDto> getQuestionsForSymptom(Long symptomId){

        Symptom symptom = symptomRepository.findById(symptomId)
                .orElseThrow(() -> new
                        IllegalArgumentException("Invalid symptom id: " + symptomId));

        return questionRepository.findBySymptom(symptom)
                .stream()
                .map(QuestionDto::from)
                .toList();
    }
}

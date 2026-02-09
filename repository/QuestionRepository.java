package com.example.demo.repository;

import com.example.demo.domain.Question;
import com.example.demo.domain.Symptom;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findBySymptom(Symptom symptom);
}

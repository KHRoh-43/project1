package com.example.demo.repository;

import com.example.demo.domain.Symptom;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SymptomRepository  extends JpaRepository<Symptom, Long> {
}

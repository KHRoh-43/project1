package com.example.demo.service;

import com.example.demo.domain.Symptom;
import com.example.demo.repository.SymptomRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SymptomService {

    private final SymptomRepository repository;

    public SymptomService(SymptomRepository repository){
        this.repository = repository;
    }
    public List<Symptom> getAll(){
        return repository.findAll();
    }
}

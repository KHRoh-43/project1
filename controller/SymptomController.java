package com.example.demo.controller;


import com.example.demo.dto.SymptomDto;
import com.example.demo.service.SymptomService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/symptoms")
public class SymptomController {

    private final SymptomService service;

    public SymptomController(SymptomService service) {
        this.service = service;
    }

    @GetMapping
    public List<SymptomDto> getAllSymptoms(){
        return service.getAll()
                .stream()
                .map(SymptomDto::from)
                .toList();
    }
}

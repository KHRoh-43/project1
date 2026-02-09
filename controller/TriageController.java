package com.example.demo.controller;


import com.example.demo.dto.TriageRequest;
import com.example.demo.dto.TriageResponse;
import com.example.demo.service.TriageService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/triage")
public class TriageController {

    private final TriageService service;

    public TriageController(TriageService service){
        this.service = service;
    }

    @PostMapping("/evaluate")
    public TriageResponse evaluate(@RequestBody TriageRequest request){
        return service.evaluate(request);
    }
}

package com.example.demo.dto;


import lombok.Data;

import java.util.Map;

@Data
public class TriageRequest {
    private Map<String, String> answers;
}

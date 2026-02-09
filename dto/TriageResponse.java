package com.example.demo.dto;


import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class TriageResponse {
    private String level;
    private String message;
}

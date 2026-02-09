package com.example.demo.dto;


import com.example.demo.domain.Symptom;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SymptomDto {
    private Long id;
    private String name;

    public static SymptomDto from(Symptom s){
        return new SymptomDto(s.getId(), s.getName());
    }
}

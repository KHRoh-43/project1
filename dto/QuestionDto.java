package com.example.demo.dto;


import com.example.demo.domain.Question;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class QuestionDto {
    private Long id;
    private String text;

    public static QuestionDto from(Question q){
        return new QuestionDto(q.getId(), q.getText());
    }
}

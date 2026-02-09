package com.example.demo.domain;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String text;

    @ManyToOne
    @JoinColumn(name = "symptom_id")
    private Symptom symptom;

    public Question(String text, Symptom symptom){
        this.text = text;
        this.symptom = symptom;
    }
}

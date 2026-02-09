package com.example.demo;

import com.example.demo.domain.Question;
import com.example.demo.domain.Symptom;
import com.example.demo.repository.QuestionRepository;
import com.example.demo.repository.SymptomRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}
    @Bean
    CommandLineRunner initData(SymptomRepository symptomRepo,
                               QuestionRepository questionRepo){
        return args -> {
            Symptom s1 = symptomRepo.save(new Symptom("기침"));
            Symptom s2 = symptomRepo.save(new Symptom("두통"));
            Symptom s3 = symptomRepo.save(new Symptom("코막힘"));
            Symptom s4 = symptomRepo.save(new Symptom("복통"));
            Symptom s5 = symptomRepo.save(new Symptom("설사"));

            questionRepo.save(new Question("갑자기 시작된 증상인가요?",s1));
            questionRepo.save(new Question("호흡이 어려운가요?", s1));
            questionRepo.save(new Question("통증이 심해지고 있나요?", s2));
            questionRepo.save(new Question("빛에 민감해지나요?", s2));
            questionRepo.save(new Question("콧물이 지속적으로 나오나요?", s3));
            questionRepo.save(new Question("오랫동안 지속된 증상인가요?", s3));
            questionRepo.save(new Question("설사가 동반되나요?", s4));
            questionRepo.save(new Question("구토증세가 동반되나요?", s4));
            questionRepo.save(new Question("증상이 오랫동안 지속되었나요?", s5));
            questionRepo.save(new Question("복통이 동반되나요?", s5));
        };
    }

}

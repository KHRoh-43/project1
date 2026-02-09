package com.example.demo.service;


import com.example.demo.dto.TriageRequest;
import com.example.demo.dto.TriageResponse;
import org.springframework.stereotype.Service;

@Service
public class TriageService {

    public TriageResponse evaluate(TriageRequest request){
        int score = 0;

        for(String key : request.getAnswers().keySet()){
            String answer = request.getAnswers().get(key);

            if(key.equals("3") && answer.equals("예")){
                return new TriageResponse(
                        "emergency",
                        "응급 상황이 의심됩니다. 즉시 응급실 방문이 필요합니다."
                );
            }
            if(answer.equals("예")){
                score += 1;
            }
        }
        if(score >= 2){
            return new TriageResponse(
                    "urgent",
                    "특정 위험 요인이 감지되어 빠른 진료가 필요합니다."
            );
        }
        return new TriageResponse(
                "normal",
                "응급 상황은 아니지만 증상 관찰이 필요합니다."
        );
    }
}

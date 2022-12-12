package com.example.sinplecalculator.model;

public class Calculator {
    public static float calculator(float so1, float so2, char chon){
        switch (chon){
            case '+':
                return so1 + so2;
            case '-':
                return so1 - so2;
            case '*':
                return so1 * so2;
            case '/':
                if (so2 != 0){
                    return so1 / so2;
                }else
                    throw new RuntimeException("Không chia cho 0");
            default:
                throw new  RuntimeException("Chon lại");
        }
    }

}

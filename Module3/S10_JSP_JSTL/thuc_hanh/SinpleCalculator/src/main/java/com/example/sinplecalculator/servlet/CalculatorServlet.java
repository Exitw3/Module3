package com.example.sinplecalculator.servlet;

import com.example.sinplecalculator.model.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        float so1 = Integer.parseInt(request.getParameter("so1"));
        float so2 = Integer.parseInt(request.getParameter("so2"));
        char chon = request.getParameter("chon").charAt(0);
        PrintWriter writer = response.getWriter();
        writer.println("<hthl>");
        writer.println("<h1>Result:</h1>");
        try {
            float result = Calculator.calculator(so1, so2, chon);
            writer.println(so1 + " " + chon + " " + so2 + " = " + result);
        }catch (Exception ex){
            writer.println("Error: " + ex.getMessage());
        }
        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

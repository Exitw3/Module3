package com.example.show_list_customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Nguyen", "2004-02-06", "Huế", "https://upload.wikimedia.org/wikipedia/commons/c/cc/Ngomon2.jpg"));
        customerList.add(new Customer("Diễm", "2003-02-04", "Huế", "https://upload.wikimedia.org/wikipedia/commons/c/cc/Ngomon2.jpg"));
        customerList.add(new Customer("Định", "2002-03-05", "Huế", "https://upload.wikimedia.org/wikipedia/commons/c/cc/Ngomon2.jpg"));
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("home.jsp");
        requestDispatcher.forward(request, response);
    }
}
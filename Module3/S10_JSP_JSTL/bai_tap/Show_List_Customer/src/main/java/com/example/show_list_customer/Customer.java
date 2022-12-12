package com.example.show_list_customer;


public class Customer{
    private String name;
    private String date;
    private String diaChi;
    private String anh;

    public Customer() {}

    public Customer(String name, String date, String diaChi, String anh) {
        this.name = name;
        this.date = date;
        this.diaChi = diaChi;
        this.anh = anh;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }
}
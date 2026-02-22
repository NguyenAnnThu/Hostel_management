package com.example.case_study.entity;

public class RevenueByQuater {
    private int year;
    private int quater;
    private double totalRevenue;

    public RevenueByQuater(int year, int quater, double totalRevenue) {
        this.year = year;
        this.quater = quater;
        this.totalRevenue = totalRevenue;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getQuater() {
        return quater;
    }

    public void setQuater(int quater) {
        this.quater = quater;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
}

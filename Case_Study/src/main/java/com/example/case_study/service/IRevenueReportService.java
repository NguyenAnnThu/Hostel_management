package com.example.case_study.service;

import com.example.case_study.entity.RevenueByRoom;

import java.util.List;
import java.util.Map;

public interface IRevenueReportService {
    int getTotalRooms();
    int getAvailableRooms();
    int getRentedRooms();
    int getMaintenanceRooms();
    int getPendingBookings();
    int getUnpaidInvoices();

    double getCurrentMonthRevenue();
    Map<String, Double> getLast3MonthsRevenue();
    double getLatestMonthRevenue();

    Map<String, Double> getLast6MonthsRevenue();
}

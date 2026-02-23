package com.example.case_study.repository;

import com.example.case_study.entity.RevenueByQuater;
import com.example.case_study.entity.RevenueByRoom;

import java.util.List;
import java.util.Map;

public interface IRevenueReportRepository {
    int countTotalRooms();
    int countAvailableRooms();
    int countRentedRooms();
    int countPendingBookings();
    int countMaintenanceRooms();
    int countUnpaidInvoices();

    double getMonthlyRevenue(int month, int year);
    Map<String, Double> getLast3MonthsRevenue();
    Map<String, Double> getLast6MonthsRevenue();
}

package com.example.case_study.service;

import com.example.case_study.entity.RevenueByRoom;
import com.example.case_study.repository.IRevenueReportRepository;
import com.example.case_study.repository.RevenueReportRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public class RevenueReportService implements IRevenueReportService{
    private final IRevenueReportRepository repo=new RevenueReportRepository();

    @Override
    public int getTotalRooms() {
        return repo.countTotalRooms();
    }

    @Override
    public int getAvailableRooms() {
        return repo.countAvailableRooms();
    }

    @Override
    public int getRentedRooms() {
        return repo.countRentedRooms();
    }

    @Override
    public int getPendingBookings() {
        return repo.countPendingBookings();
    }

    @Override
    public int getUnpaidInvoices() {
        return repo.countUnpaidInvoices();
    }

    @Override
    public double getCurrentMonthRevenue() {
        return repo.getLast6MonthsRevenue()
                .values()
                .stream()
                .findFirst()
                .orElse(0.0);
    }

    @Override
    public Map<String, Double> getLast6MonthsRevenue() {
        return repo.getLast6MonthsRevenue();
    }
    @Override
    public Map<String, Double> getLast3MonthsRevenue() {
        return repo.getLast3MonthsRevenue();
    }

    @Override
    public double getLatestMonthRevenue() {
        return repo.getLast3MonthsRevenue()
                .values()
                .stream()
                .findFirst()
                .orElse(0.0);
    }

}

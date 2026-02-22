package com.example.case_study.repository;

import com.example.case_study.entity.ServicePriceConfig;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface IServicePriceConfigRepository {
    Double findCurrentPrice(String serviceCode);

    void insertPrice(String serviceCode, double price, LocalDate date);
}

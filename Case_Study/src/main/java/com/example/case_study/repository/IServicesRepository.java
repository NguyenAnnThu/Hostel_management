package com.example.case_study.repository;

import com.example.case_study.entity.Services;
import java.util.List;
import java.util.Map;

public interface IServicesRepository {

    List<Map<String, Object>> findAllServices();

    void insertService(
            String code,
            String name,
            String type,
            String unit,
            double price,
            String status
    );

    void updateService(
            String code,
            String name,
            String type,
            String unit,
            double price,
            String status
    );

    void insertServicePriceConfig(String serviceCode, double price);
}

package com.example.case_study.repository;

import com.example.case_study.entity.ServicePriceConfig;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class ServicePriceConfigRepository implements IServicePriceConfigRepository {
    private final IServicesRepository repo = new ServicesRepository();

    @Override
    public List<Map<String, Object>> getAllServices() {
        return repo.findAllServices();
    }

    @Override
    public void createService(Map<String, String> d) {
        repo.insertService(
                d.get("code"),
                d.get("name"),
                d.get("type"),
                d.get("unit"),
                Double.parseDouble(d.get("price")),
                d.get("status")
        );
    }

    @Override
    public void updateService(Map<String, String> d) {
        repo.updateService(
                d.get("code"),
                d.get("name"),
                d.get("type"),
                d.get("unit"),
                Double.parseDouble(d.get("price")),
                d.get("status")
        );
    }
}

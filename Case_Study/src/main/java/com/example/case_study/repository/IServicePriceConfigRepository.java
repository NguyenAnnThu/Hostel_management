package com.example.case_study.repository;

import com.example.case_study.entity.ServicePriceConfig;
import java.util.List;
import java.util.Map;

public interface IServicePriceConfigRepository {


    List<Map<String, Object>> getAllServices();

    void createService(Map<String, String> data);

    void updateService(Map<String, String> data);
}

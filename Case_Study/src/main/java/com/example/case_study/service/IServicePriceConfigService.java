package com.example.case_study.service;

import com.example.case_study.entity.ServicePriceConfig;
import java.util.List;

public interface IServicePriceConfigService {

    List<ServicePriceConfig> getAll();

    boolean add(ServicePriceConfig config);

    boolean update(ServicePriceConfig config);

    boolean delete(int configId);

    ServicePriceConfig findById(int configId);

    List<ServicePriceConfig> findByServiceCode(String serviceCode);

    ServicePriceConfig getEffectivePrice(String serviceCode);
}

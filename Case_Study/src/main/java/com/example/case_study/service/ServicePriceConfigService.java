package com.example.case_study.service;

import com.example.case_study.entity.ServicePriceConfig;
import com.example.case_study.repository.IServicePriceConfigRepository;
import com.example.case_study.repository.ServicePriceConfigRepository;
import java.util.List;

public class ServicePriceConfigService implements IServicePriceConfigService {

    private IServicePriceConfigRepository servicePriceConfigRepository;

    public ServicePriceConfigService() {
        servicePriceConfigRepository = new ServicePriceConfigRepository();
    }

    @Override
    public List<ServicePriceConfig> getAll() {
        return servicePriceConfigRepository.getAll();
    }

    @Override
    public boolean add(ServicePriceConfig config) {
        return servicePriceConfigRepository.add(config);
    }

    @Override
    public boolean update(ServicePriceConfig config) {
        return servicePriceConfigRepository.update(config);
    }

    @Override
    public boolean delete(int configId) {
        return servicePriceConfigRepository.delete(configId);
    }

    @Override
    public ServicePriceConfig findById(int configId) {
        return servicePriceConfigRepository.findById(configId);
    }

    @Override
    public List<ServicePriceConfig> findByServiceCode(String serviceCode) {
        return servicePriceConfigRepository.findByServiceCode(serviceCode);
    }

    @Override
    public ServicePriceConfig getEffectivePrice(String serviceCode) {
        return servicePriceConfigRepository.getEffectivePrice(serviceCode);
    }
}

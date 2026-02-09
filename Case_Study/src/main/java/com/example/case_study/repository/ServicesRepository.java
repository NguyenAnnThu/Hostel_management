package com.example.case_study.repository;

import com.example.case_study.entity.Services;

import java.util.ArrayList;
import java.util.List;

public class ServicesRepository implements IServicesRepository {

    private List<Services> servicesList = new ArrayList<>();

    @Override
    public List<Services> getAll() {
        return servicesList;
    }

    @Override
    public boolean add(Services service) {
        if (service == null) return false;

        if (findByCode(service.getServiceCode()) != null) {
            return false; // trùng mã dịch vụ
        }

        servicesList.add(service);
        return true;
    }

    @Override
    public boolean update(Services service) {
        Services existing = findByCode(service.getServiceCode());
        if (existing == null) return false;

        existing.setServiceName(service.getServiceName());
        existing.setServiceType(service.getServiceType());
        existing.setUnit(service.getUnit());
        existing.setDefaultPrice(service.getDefaultPrice());
        existing.setStatus(service.getStatus());
        return true;
    }

    @Override
    public boolean delete(String serviceCode) {
        return servicesList.removeIf(s -> s.getServiceCode().equalsIgnoreCase(serviceCode));
    }

    @Override
    public Services findByCode(String serviceCode) {
        for (Services s : servicesList) {
            if (s.getServiceCode().equalsIgnoreCase(serviceCode)) {
                return s;
            }
        }
        return null;
    }

    @Override
    public List<Services> findByType(String serviceType) {
        List<Services> result = new ArrayList<>();
        for (Services s : servicesList) {
            if (s.getServiceType().equalsIgnoreCase(serviceType)) {
                result.add(s);
            }
        }
        return result;
    }

    @Override
    public List<Services> findByStatus(String status) {
        List<Services> result = new ArrayList<>();
        for (Services s : servicesList) {
            if (s.getStatus().equalsIgnoreCase(status)) {
                result.add(s);
            }
        }
        return result;
    }
}

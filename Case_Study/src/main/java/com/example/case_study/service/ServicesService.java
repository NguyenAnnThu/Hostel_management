package com.example.case_study.service;

import com.example.case_study.entity.Services;
import com.example.case_study.repository.IServicesRepository;
import com.example.case_study.repository.ServicesRepository;

import java.util.List;

public class ServicesService implements IServicesService {

    private IServicesRepository servicesRepository;

    public ServicesService() {
        servicesRepository = new ServicesRepository();
    }

    @Override
    public List<Services> getAllServices() {
        return servicesRepository.getAll();
    }

    @Override
    public boolean addService(Services service) {
        return servicesRepository.add(service);
    }

    @Override
    public boolean updateService(Services service) {
        return servicesRepository.update(service);
    }

    @Override
    public boolean deleteService(String serviceCode) {
        return servicesRepository.delete(serviceCode);
    }

    @Override
    public Services getServiceByCode(String serviceCode) {
        return servicesRepository.findByCode(serviceCode);
    }

    @Override
    public List<Services> getServicesByType(String serviceType) {
        return servicesRepository.findByType(serviceType);
    }

    @Override
    public List<Services> getServicesByStatus(String status) {
        return servicesRepository.findByStatus(status);
    }
}

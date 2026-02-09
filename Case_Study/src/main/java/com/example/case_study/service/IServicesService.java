package com.example.case_study.service;

import com.example.case_study.entity.Services;
import java.util.List;

public interface IServicesService {

    List<Services> getAllServices();

    boolean addService(Services service);

    boolean updateService(Services service);

    boolean deleteService(String serviceCode);

    Services getServiceByCode(String serviceCode);

    List<Services> getServicesByType(String serviceType);

    List<Services> getServicesByStatus(String status);
}

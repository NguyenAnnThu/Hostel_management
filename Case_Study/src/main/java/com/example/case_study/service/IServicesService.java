package com.example.case_study.service;

import com.example.case_study.entity.Services;
import com.google.protobuf.Service;

import java.util.List;

public interface IServicesService {

    List<Service> findAll();
    Service findByCode(String code);
    void save(Service service);
    void update(Service service);
}

package com.example.case_study.service;

import com.example.case_study.entity.Services;
import com.example.case_study.repository.IServicesRepository;
import com.example.case_study.repository.ServicesRepository;
import com.google.protobuf.Service;

import java.util.List;

public class ServicesService implements IServicesService {


    @Override
    public List<Service> findAll() {
        return List.of();
    }

    @Override
    public Service findByCode(String code) {
        return null;
    }

    @Override
    public void save(Service service) {

    }

    @Override
    public void update(Service service) {

    }
}

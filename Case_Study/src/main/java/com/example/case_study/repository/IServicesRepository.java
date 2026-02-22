package com.example.case_study.repository;

import com.example.case_study.entity.Services;

import java.security.Provider;
import java.util.List;
import java.util.Map;

public interface IServicesRepository {

    List<Services> findAll();

    Services findByCode(String serviceCode);

    void insert(Services service);

    void update(Services service);
}

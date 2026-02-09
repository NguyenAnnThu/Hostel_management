package com.example.case_study.repository;

import com.example.case_study.entity.Services;
import java.util.List;

public interface IServicesRepository {

    List<Services> getAll();

    boolean add(Services service);

    boolean update(Services service);

    boolean delete(String serviceCode);

    Services findByCode(String serviceCode);

    List<Services> findByType(String serviceType);

    List<Services> findByStatus(String status);
}

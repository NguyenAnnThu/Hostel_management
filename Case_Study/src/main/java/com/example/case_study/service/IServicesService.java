package com.example.case_study.service;

import com.example.case_study.entity.Services;
import com.google.protobuf.Service;

import java.util.List;

public interface IServicesService {

    List<Services> getAllWithPrice();

    void saveOrUpdate(Services service, double price);
}

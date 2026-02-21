package com.example.case_study.service;

import com.example.case_study.entity.Services;
import com.example.case_study.repository.IServicePriceConfigRepository;
import com.example.case_study.repository.IServicesRepository;
import com.example.case_study.repository.ServicePriceConfigRepository;
import com.example.case_study.repository.ServicesRepository;

import java.time.LocalDate;
import java.util.List;


public class ServicesService implements IServicesService {
    private final IServicesRepository servicesRepo = new ServicesRepository();
    private final IServicePriceConfigRepository priceRepo =
            new ServicePriceConfigRepository();

    @Override
    public List<Services> getAllWithPrice() {
        List<Services> list = servicesRepo.findAll();

        for (Services s : list) {
            Double price = priceRepo.findCurrentPrice(s.getServiceCode());
            s.setDefaultPrice(price != null ? price : s.getDefaultPrice());
        }
        return list;
    }

    @Override
    public void saveOrUpdate(Services s, double price) {
        if (servicesRepo.findByCode(s.getServiceCode()) == null) {
            servicesRepo.insert(s);
        } else {
            servicesRepo.update(s);
        }

        priceRepo.insertPrice(
                s.getServiceCode(),
                price,
                LocalDate.now()
        );
    }
}


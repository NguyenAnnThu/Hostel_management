package com.example.case_study.service;

import com.example.case_study.entity.ServiceMeters;
import com.example.case_study.repository.IServiceMetersRepository;
import com.example.case_study.repository.ServiceMetersRepository;
import java.util.List;

public class ServiceMetersService implements IServiceMetersService {

    private IServiceMetersRepository serviceMetersRepository;

    public ServiceMetersService() {
        serviceMetersRepository = new ServiceMetersRepository();
    }

    @Override
    public List<ServiceMeters> getAll() {
        return serviceMetersRepository.getAll();
    }

    @Override
    public boolean add(ServiceMeters meter) {
        return serviceMetersRepository.add(meter);
    }

    @Override
    public boolean update(ServiceMeters meter) {
        return serviceMetersRepository.update(meter);
    }

    @Override
    public boolean delete(int meterId) {
        return serviceMetersRepository.delete(meterId);
    }

    @Override
    public ServiceMeters findById(int meterId) {
        return serviceMetersRepository.findById(meterId);
    }

    @Override
    public List<ServiceMeters> findByRoom(String roomId) {
        return serviceMetersRepository.findByRoom(roomId);
    }

    @Override
    public ServiceMeters findByRoomAndServiceAndMonth(String roomId, String serviceCode, int month, int year) {
        return serviceMetersRepository.findByRoomAndServiceAndMonth(roomId, serviceCode, month, year);
    }
}

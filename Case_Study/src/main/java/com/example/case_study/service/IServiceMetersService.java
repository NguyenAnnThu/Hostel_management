package com.example.case_study.service;

import com.example.case_study.entity.ServiceMeters;
import java.util.List;

public interface IServiceMetersService {

    List<ServiceMeters> getAll();

    boolean add(ServiceMeters meter);

    boolean update(ServiceMeters meter);

    boolean delete(int meterId);

    ServiceMeters findById(int meterId);

    List<ServiceMeters> findByRoom(String roomId);

    ServiceMeters findByRoomAndServiceAndMonth(String roomId, String serviceCode, int month, int year);
}

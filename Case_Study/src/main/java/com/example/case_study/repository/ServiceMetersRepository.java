package com.example.case_study.repository;

import com.example.case_study.entity.ServiceMeters;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ServiceMetersRepository implements IServiceMetersRepository {

    private List<ServiceMeters> meterList = new ArrayList<>();
    private int autoId = 1;

    @Override
    public List<ServiceMeters> getAll() {
        return meterList;
    }

    @Override
    public boolean add(ServiceMeters meter) {
        if (meter == null) return false;

        meter.setMeterId(autoId++);
        meter.setRecordDate(new Date());
        meterList.add(meter);
        return true;
    }

    @Override
    public boolean update(ServiceMeters meter) {
        for (ServiceMeters m : meterList) {
            if (m.getMeterId() == meter.getMeterId()) {
                m.setOldValue(meter.getOldValue());
                m.setNewValue(meter.getNewValue());
                m.setMonth(meter.getMonth());
                m.setYear(meter.getYear());
                m.setServiceCode(meter.getServiceCode());
                m.setRoomId(meter.getRoomId());
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean delete(int meterId) {
        return meterList.removeIf(m -> m.getMeterId() == meterId);
    }

    @Override
    public ServiceMeters findById(int meterId) {
        for (ServiceMeters m : meterList) {
            if (m.getMeterId() == meterId) {
                return m;
            }
        }
        return null;
    }

    @Override
    public List<ServiceMeters> findByRoom(String roomId) {
        List<ServiceMeters> result = new ArrayList<>();
        for (ServiceMeters m : meterList) {
            if (m.getRoomId().equalsIgnoreCase(roomId)) {
                result.add(m);
            }
        }
        return result;
    }

    @Override
    public ServiceMeters findByRoomAndServiceAndMonth(String roomId, String serviceCode, int month, int year) {
        for (ServiceMeters m : meterList) {
            if (m.getRoomId().equalsIgnoreCase(roomId)
                    && m.getServiceCode().equalsIgnoreCase(serviceCode)
                    && m.getMonth() == month
                    && m.getYear() == year) {
                return m;
            }
        }
        return null;
    }
}

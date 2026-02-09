package com.example.case_study.repository;

import com.example.case_study.entity.ServicePriceConfig;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ServicePriceConfigRepository implements IServicePriceConfigRepository {

    private List<ServicePriceConfig> configList = new ArrayList<>();
    private int autoId = 1;

    @Override
    public List<ServicePriceConfig> getAll() {
        return configList;
    }

    @Override
    public boolean add(ServicePriceConfig config) {
        if (config == null) return false;

        config.setConfigId(autoId++);
        if (config.getEffectiveDate() == null) {
            config.setEffectiveDate(new Date());
        }

        configList.add(config);
        return true;
    }

    @Override
    public boolean update(ServicePriceConfig config) {
        for (ServicePriceConfig c : configList) {
            if (c.getConfigId() == config.getConfigId()) {
                c.setServiceCode(config.getServiceCode());
                c.setPrice(config.getPrice());
                c.setEffectiveDate(config.getEffectiveDate());
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean delete(int configId) {
        return configList.removeIf(c -> c.getConfigId() == configId);
    }

    @Override
    public ServicePriceConfig findById(int configId) {
        for (ServicePriceConfig c : configList) {
            if (c.getConfigId() == configId) {
                return c;
            }
        }
        return null;
    }

    @Override
    public List<ServicePriceConfig> findByServiceCode(String serviceCode) {
        List<ServicePriceConfig> result = new ArrayList<>();
        for (ServicePriceConfig c : configList) {
            if (c.getServiceCode().equalsIgnoreCase(serviceCode)) {
                result.add(c);
            }
        }
        return result;
    }

    // Lấy giá có hiệu lực mới nhất
    @Override
    public ServicePriceConfig getEffectivePrice(String serviceCode) {
        ServicePriceConfig latest = null;
        Date now = new Date();

        for (ServicePriceConfig c : configList) {
            if (c.getServiceCode().equalsIgnoreCase(serviceCode)
                    && c.getEffectiveDate().before(now)) {

                if (latest == null || c.getEffectiveDate().after(latest.getEffectiveDate())) {
                    latest = c;
                }
            }
        }
        return latest;
    }
}

package com.example.case_study.service;

import com.example.case_study.entity.RoomTenants;
import com.example.case_study.repository.IRoomTenantsRepository;
import com.example.case_study.repository.RoomTenantsRepository;
import java.util.List;

public class RoomTenantsService implements IRoomTenantsService {

    private IRoomTenantsRepository roomTenantsRepository;

    public RoomTenantsService() {
        roomTenantsRepository = new RoomTenantsRepository();
    }

    @Override
    public List<RoomTenants> getAll() {
        return roomTenantsRepository.getAll();
    }

    @Override
    public boolean addTenant(RoomTenants tenant) {
        return roomTenantsRepository.addTenant(tenant);
    }

    @Override
    public boolean updateTenant(RoomTenants tenant) {
        return roomTenantsRepository.updateTenant(tenant);
    }

    @Override
    public boolean removeTenant(int id) {
        return roomTenantsRepository.removeTenant(id);
    }

    @Override
    public List<RoomTenants> findByRoomId(String roomId) {
        return roomTenantsRepository.findByRoomId(roomId);
    }

    @Override
    public List<RoomTenants> findByUserId(String userId) {
        return roomTenantsRepository.findByUserId(userId);
    }

    @Override
    public List<RoomTenants> findActiveTenantsByRoom(String roomId) {
        return roomTenantsRepository.findActiveTenantsByRoom(roomId);
    }
}

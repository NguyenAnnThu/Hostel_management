package com.example.case_study.repository;

import com.example.case_study.entity.RoomTenants;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RoomTenantsRepository implements IRoomTenantsRepository {

    private List<RoomTenants> tenantList = new ArrayList<>();
    private int autoId = 1;

    @Override
    public List<RoomTenants> getAll() {
        return tenantList;
    }

    // Thêm người vào phòng
    @Override
    public boolean addTenant(RoomTenants tenant) {
        if (tenant == null) return false;

        tenant.setId(autoId++);
        tenant.setMoveInDate(new Date());
        tenantList.add(tenant);
        return true;
    }

    // Cập nhật
    @Override
    public boolean updateTenant(RoomTenants tenant) {
        for (RoomTenants t : tenantList) {
            if (t.getId() == tenant.getId()) {
                t.setRole(tenant.getRole());
                t.setStatus(tenant.getStatus());
                t.setMoveOutDate(tenant.getMoveOutDate());
                t.setNote(tenant.getNote());
                return true;
            }
        }
        return false;
    }

    // Xóa record
    @Override
    public boolean removeTenant(int id) {
        return tenantList.removeIf(t -> t.getId() == id);
    }

    // Tìm theo phòng
    @Override
    public List<RoomTenants> findByRoomId(String roomId) {
        List<RoomTenants> result = new ArrayList<>();
        for (RoomTenants t : tenantList) {
            if (t.getRoomId().equalsIgnoreCase(roomId)) {
                result.add(t);
            }
        }
        return result;
    }

    // Tìm theo user
    @Override
    public List<RoomTenants> findByUserId(String userId) {
        List<RoomTenants> result = new ArrayList<>();
        for (RoomTenants t : tenantList) {
            if (t.getUserId().equalsIgnoreCase(userId)) {
                result.add(t);
            }
        }
        return result;
    }

    // Người đang ở (ACTIVE)
    @Override
    public List<RoomTenants> findActiveTenantsByRoom(String roomId) {
        List<RoomTenants> result = new ArrayList<>();
        for (RoomTenants t : tenantList) {
            if (t.getRoomId().equalsIgnoreCase(roomId) &&
                    t.getStatus().equalsIgnoreCase("ACTIVE")) {
                result.add(t);
            }
        }
        return result;
    }
}

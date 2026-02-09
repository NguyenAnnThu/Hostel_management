package com.example.case_study.repository;

import com.example.case_study.entity.RoomTenants;
import java.util.List;

public interface IRoomTenantsRepository {

    List<RoomTenants> getAll();

    boolean addTenant(RoomTenants tenant);

    boolean updateTenant(RoomTenants tenant);

    boolean removeTenant(int id);

    List<RoomTenants> findByRoomId(String roomId);

    List<RoomTenants> findByUserId(String userId);

    List<RoomTenants> findActiveTenantsByRoom(String roomId);
}

package com.example.case_study.repository;

import com.example.case_study.entity.Rooms;
import dto.RoomDTO;

import java.util.List;

public interface IRoomsRepository {

    List<RoomDTO> getAllRooms();

    boolean updateRoomStatus(String roomId, String status);

    // lấy toàn bộ phòng hiển thị cho user
    List<Rooms> getRoomsList();

    boolean addRoom(Rooms room);

    boolean updateRoom(Rooms room);

    boolean deleteRoom(String roomId);

    Rooms findById(String roomId);

    List<Rooms> findByStatus(String status);

    List<Rooms> findByFloor(int floor);

    List<Rooms> searchRooms(String roomName, Integer floor);
}
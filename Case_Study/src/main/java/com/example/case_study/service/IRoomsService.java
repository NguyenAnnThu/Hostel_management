package com.example.case_study.service;

import com.example.case_study.entity.Rooms;
import dto.RoomDTO;

import java.util.List;

public interface IRoomsService {

    List<RoomDTO> getAllRooms();

    boolean addRoom(Rooms room);

    boolean updateRoom(Rooms room);

    boolean deleteRoom(String roomId);

    Rooms findById(String roomId);

    List<Rooms> findByStatus(String status);

    List<Rooms> findByFloor(int floor);
}

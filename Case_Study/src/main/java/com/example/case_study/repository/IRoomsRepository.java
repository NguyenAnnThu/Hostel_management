package com.example.case_study.repository;

import com.example.case_study.dto.RoomDTO;
import com.example.case_study.entity.Rooms;

import java.util.List;

public interface IRoomsRepository {

    List<Rooms> getAllRooms();

    List<RoomDTO> getAllRoomsDTO();

    List<Integer> getAllFloors();

    List<String> getAllStatus();

    boolean addRoom(Rooms room);

    boolean updateRoom(Rooms room);

    boolean deleteRoom(String roomId);

    Rooms findById(String roomId);

    List<Rooms> findByStatus(String status);

    List<Rooms> findByFloor(int floor);

    List<RoomDTO> filterRooms(int floor, String status, double minPrice, double maxPrice, String roomId);
}

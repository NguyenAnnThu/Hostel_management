package com.example.case_study.service;

import com.example.case_study.dto.RoomDTO;
import com.example.case_study.entity.Rooms;

import java.util.List;
import java.util.Map;

public interface IRoomOwnerService {

    List<Rooms> getAllRooms();

    List<RoomDTO> getAllRoomsDTO();

    List<Integer> getAllFloors();

    List<String> getAllStatus();

    Map<String, String> addRoom(Rooms room, String fileName, long fileSize);

    Map<String, String> updateRoom(Rooms room, String fileName, long fileSize);

    Map<String, String> deleteRoom(String roomId);

    Rooms findById(String roomId);

    List<Rooms> findByStatus(String status);

    List<Rooms> findByFloor(int floor);

    List<RoomDTO> filterRooms(int floor, String status, double minPrice, double maxPrice, String roomId);
}

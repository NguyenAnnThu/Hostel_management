package com.example.case_study.service;

import com.example.case_study.entity.Rooms;
import com.example.case_study.repository.IRoomsRepository;
import com.example.case_study.repository.RoomsRepository;
import java.util.List;

public class RoomsService implements IRoomsService {

    private IRoomsRepository roomsRepository;

    public RoomsService() {
        roomsRepository = new RoomsRepository();
    }

    @Override
    public List<Rooms> getAllRooms() {
        return roomsRepository.getAllRooms();
    }

    @Override
    public boolean addRoom(Rooms room) {
        return roomsRepository.addRoom(room);
    }

    @Override
    public boolean updateRoom(Rooms room) {
        return roomsRepository.updateRoom(room);
    }

    @Override
    public boolean deleteRoom(String roomId) {
        return roomsRepository.deleteRoom(roomId);
    }

    @Override
    public Rooms findById(String roomId) {
        return roomsRepository.findById(roomId);
    }

    @Override
    public List<Rooms> findByStatus(String status) {
        return roomsRepository.findByStatus(status);
    }

    @Override
    public List<Rooms> findByFloor(int floor) {
        return roomsRepository.findByFloor(floor);
    }
}

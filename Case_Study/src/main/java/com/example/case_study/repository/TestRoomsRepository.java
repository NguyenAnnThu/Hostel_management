package com.example.case_study.repository;

import dto.RoomDTO;

import java.util.List;

public class TestRoomsRepository {
    public static void main(String[] args) {
        IRoomsRepository roomsRepository = new RoomsRepository();
        List<RoomDTO> rooms = roomsRepository.getAllRooms();
        System.out.println("Total rooms: "+rooms.size());
        for (RoomDTO r : rooms) {
            System.out.println(r);
        }
    }
}

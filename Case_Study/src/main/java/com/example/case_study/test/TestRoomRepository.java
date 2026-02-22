package com.example.case_study.test;

import com.example.case_study.entity.Rooms;
import com.example.case_study.repository.RoomsRepository;

import java.util.Date;
import java.util.List;

public class TestRoomRepository {
    public static void main(String[] args) {
        List<Integer> floors = new RoomsRepository().getAllFloors();

        for (Integer floor : floors) {
            System.out.println(floor);
        }

        List<String> status = new RoomsRepository().getAllStatus();

        for (String s : status) {
            System.out.println(s);
        }
    }
}

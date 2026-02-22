//package com.example.case_study;
//
//import com.example.case_study.entity.Rooms;
//import com.example.case_study.repository.IRoomsRepository;
//import com.example.case_study.service.RoomsService;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//import org.mockito.InjectMocks;
//import org.mockito.Mock;
//import org.mockito.MockitoAnnotations;
//
//import java.util.Date;
//import java.util.Map;
//
//import static org.junit.jupiter.api.Assertions.*;
//import static org.mockito.Mockito.*;
//
//public class TestRoomService {
//
//    @InjectMocks
//    private RoomsService roomsService;
//
//    @Mock
//    private IRoomsRepository roomsRepository;
//
//    @BeforeEach
//    void init() {
//        MockitoAnnotations.openMocks(this);
//    }
//
//    private Rooms validRoom() {
//        return new Rooms("R101",1,25,3000000,2,"Test","AVAILABLE",new Date(),null);
//    }
//
//    @Test
//    void addRoom_success() {
//        Rooms r = validRoom();
//
//        when(roomsRepository.findById("R101")).thenReturn(null);
//        when(roomsRepository.addRoom(any())).thenReturn(true);
//
//        Map<String, String> errors = roomsService.addRoom(r);
//
//        assertTrue(errors.isEmpty());
//    }
//
//    @Test
//    void addRoom_roomIdEmpty() {
//        Rooms r = validRoom();
//        r.setRoomId("");
//        Map<String, String> errors = roomsService.addRoom(r);
//        assertTrue(errors.containsKey("roomId"));
//    }
//
//    @Test
//    void addRoom_invalidRegex() {
//        Rooms r = validRoom();
//        r.setRoomId("ABC");
//        Map<String, String> errors = roomsService.addRoom(r);
//        assertEquals("Mã phòng không đúng định dạng (VD: R101, R202)", errors.get("roomId"));
//    }
//
//    @Test
//    void addRoom_duplicateId() {
//        Rooms r = validRoom();
//
//        when(roomsRepository.findById("R101")).thenReturn(r);
//
//        Map<String, String> errors = roomsService.addRoom(r);
//
//        assertTrue(errors.containsKey("roomId"));
//    }
//
//    @Test
//    void addRoom_areaInvalid() {
//        Rooms r = validRoom();
//        r.setArea(0);
//
//        Map<String, String> errors = roomsService.addRoom(r);
//
//        assertTrue(errors.containsKey("area"));
//    }
//
//    @Test
//    void addRoom_priceInvalid() {
//        Rooms r = validRoom();
//        r.setPrice(-1);
//
//        Map<String, String> errors = roomsService.addRoom(r);
//
//        assertTrue(errors.containsKey("price"));
//    }
//
//    @Test
//    void addRoom_maxOccupantsInvalid() {
//        Rooms r = validRoom();
//        r.setMaxOccupants(0);
//
//        Map<String, String> errors = roomsService.addRoom(r);
//
//        assertTrue(errors.containsKey("maxOccupants"));
//    }
//
//    @Test
//    void addRoom_insertFail() {
//        Rooms r = validRoom();
//
//        when(roomsRepository.findById("R101")).thenReturn(null);
//        when(roomsRepository.addRoom(any())).thenReturn(false);
//
//        Map<String, String> errors = roomsService.addRoom(r);
//
//        assertTrue(errors.containsKey("systemError"));
//    }
//}
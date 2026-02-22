package com.example.case_study.service;

import com.example.case_study.dto.RoomDTO;
import com.example.case_study.entity.Rooms;
import com.example.case_study.repository.IRoomsRepository;
import com.example.case_study.repository.RoomOwnerRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RoomOwnerService implements IRoomsService {

    private IRoomsRepository roomsRepository = new RoomOwnerRepository();
    private static final long MAX_FILE_SIZE = 5 * 1024 * 1024;
    private static final List<String> ALLOWED_EXTENSIONS = List.of("jpg", "jpeg", "png", "webp");

    @Override
    public List<Rooms> getAllRooms() {
        return roomsRepository.getAllRooms();
    }

    @Override
    public List<RoomDTO> getAllRoomsDTO() {
        return roomsRepository.getAllRoomsDTO();
    }

    @Override
    public List<Integer> getAllFloors() {
        return roomsRepository.getAllFloors();
    }

    @Override
    public List<String> getAllStatus() {
        return roomsRepository.getAllStatus();
    }

    private Map<String, String> validateRoomFields(Rooms room) {
        Map<String, String> errorMap = new HashMap<>();
        if (room.getArea() <= 0)
            errorMap.put("area", "Diện tích phòng phải lớn hơn 0.");
        if (room.getPrice() <= 0)
            errorMap.put("price", "Giá phòng phải lớn hơn 0.");
        if (room.getMaxOccupants() <= 0)
            errorMap.put("maxOccupants", "Số lượng người tối đa từ 1 trở lên.");
        return errorMap;
    }

    private void validateImage(String fileName, long fileSize, Map<String, String> errorMap) {
        if (fileName == null || fileName.isEmpty()) return;

        String ext = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
        if (!ALLOWED_EXTENSIONS.contains(ext)) {
            errorMap.put("image", "Chỉ chấp nhận file ảnh: jpg, jpeg, png, webp.");
        }

        if (fileSize > MAX_FILE_SIZE) {
            errorMap.put("image", "Kích thước ảnh không được vượt quá 5MB.");
        }
    }

    @Override
    public Map<String, String> addRoom(Rooms room, String fileName, long fileSize) {
        Map<String, String> errorMap = validateRoomFields(room);
        validateImage(fileName, fileSize, errorMap);
        String roomId = room.getRoomId();
        if (roomId == null || roomId.trim().isEmpty()) {
            errorMap.put("roomId", "Mã phòng không được để trống.");
        } else if (!roomId.matches("^R\\d+$")) {
            errorMap.put("roomId", "Mã phòng không đúng định dạng (VD: R101, R202)");
        } else if (roomsRepository.findById(roomId) != null) {
            errorMap.put("roomId", "Mã phòng này đã tồn tại trong hệ thống!");
        }

        if (errorMap.isEmpty()) {
            if (!roomsRepository.addRoom(room)) {
                errorMap.put("systemError", "Lỗi hệ thống: Không thể lưu vào cơ sở dữ liệu.");
            }
        }
        return errorMap;
    }

    @Override
    public Map<String, String> updateRoom(Rooms room, String fileName, long fileSize) {
        Map<String, String> errorMap = validateRoomFields(room);
        validateImage(fileName, fileSize, errorMap);
        String roomId = room.getRoomId();
        if (roomId == null || roomId.trim().isEmpty()) {
            errorMap.put("roomId", "Mã phòng không được để trống.");
        } else if (roomsRepository.findById(roomId) == null) {
            errorMap.put("roomId", "Mã phòng này không tồn tại trong hệ thống!");
        }

        if (errorMap.isEmpty()) {
            if (!roomsRepository.updateRoom(room)) {
                errorMap.put("systemError", "Lỗi hệ thống: Không thể lưu vào cơ sở dữ liệu.");
            }
        }
        return errorMap;
    }

    @Override
    public Map<String, String> deleteRoom(String roomId) {
        Map<String, String> errorMap = new HashMap<>();
        if (roomId == null || roomId.trim().isEmpty()) {
            errorMap.put("roomId", "Mã phòng không được để trống.");
        } else if (roomsRepository.findById(roomId) == null) {
            errorMap.put("roomId", "Mã phòng này không tồn tại trong hệ thống!");
        }

        if (errorMap.isEmpty()) {
            if (!roomsRepository.deleteRoom(roomId)) {
                errorMap.put("systemError", "Lỗi hệ thống: Không thể xóa phòng khỏi cơ sở dữ liệu.");
            }
        }
        return errorMap;
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

    @Override
    public List<RoomDTO> filterRooms(int floor, String status, double minPrice, double maxPrice, String roomId) {
        if (minPrice > maxPrice) {
            double temp = minPrice;
            minPrice = maxPrice;
            maxPrice = temp;
        }
        return roomsRepository.filterRooms(floor, status, minPrice, maxPrice, roomId);
    }
}

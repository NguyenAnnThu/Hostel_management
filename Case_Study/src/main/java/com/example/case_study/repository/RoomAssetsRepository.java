package com.example.case_study.repository;

import com.example.case_study.entity.RoomAssets;

import java.util.ArrayList;
import java.util.List;

public class RoomAssetsRepository implements IRoomAssetsRepository {

    private List<RoomAssets> roomAssetsList;

    public RoomAssetsRepository() {
        roomAssetsList = new ArrayList<>();
    }

    // Lấy tất cả tài sản phòng
    @Override
    public List<RoomAssets> getAllRoomAssets() {
        return roomAssetsList;
    }

    // Thêm tài sản vào phòng
    @Override
    public boolean addRoomAsset(RoomAssets asset) {
        if (asset == null) return false;

        if (findById(asset.getId()) != null) {
            return false; // trùng ID
        }

        roomAssetsList.add(asset);
        return true;
    }

    // Cập nhật số lượng tài sản
    @Override
    public boolean updateRoomAsset(RoomAssets asset) {
        RoomAssets existing = findById(asset.getId());
        if (existing == null) return false;

        existing.setRoomId(asset.getRoomId());
        existing.setAssetCode(asset.getAssetCode());
        existing.setQuantity(asset.getQuantity());
        return true;
    }

    // Xóa tài sản
    @Override
    public boolean deleteRoomAsset(int id) {
        return roomAssetsList.removeIf(a -> a.getId() == id);
    }

    // Tìm theo ID
    @Override
    public RoomAssets findById(int id) {
        for (RoomAssets a : roomAssetsList) {
            if (a.getId() == id) {
                return a;
            }
        }
        return null;
    }

    // Lấy tất cả tài sản của 1 phòng
    @Override
    public List<RoomAssets> findByRoomId(String roomId) {
        List<RoomAssets> result = new ArrayList<>();
        for (RoomAssets a : roomAssetsList) {
            if (a.getRoomId().equalsIgnoreCase(roomId)) {
                result.add(a);
            }
        }
        return result;
    }

    // Tìm theo mã tài sản (ví dụ: BED, FAN)
    @Override
    public List<RoomAssets> findByAssetCode(String assetCode) {
        List<RoomAssets> result = new ArrayList<>();
        for (RoomAssets a : roomAssetsList) {
            if (a.getAssetCode().equalsIgnoreCase(assetCode)) {
                result.add(a);
            }
        }
        return result;
    }
}

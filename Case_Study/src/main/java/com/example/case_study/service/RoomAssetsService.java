package com.example.case_study.service;

import com.example.case_study.entity.RoomAssets;
import com.example.case_study.repository.IRoomAssetsRepository;
import com.example.case_study.repository.RoomAssetsRepository;
import java.util.List;

public class RoomAssetsService implements IRoomAssetsService {

    private IRoomAssetsRepository roomAssetsRepository;

    public RoomAssetsService() {
        roomAssetsRepository = new RoomAssetsRepository();
    }

    @Override
    public List<RoomAssets> getAllRoomAssets() {
        return roomAssetsRepository.getAllRoomAssets();
    }

    @Override
    public boolean addRoomAsset(RoomAssets asset) {
        return roomAssetsRepository.addRoomAsset(asset);
    }

    @Override
    public boolean updateRoomAsset(RoomAssets asset) {
        return roomAssetsRepository.updateRoomAsset(asset);
    }

    @Override
    public boolean deleteRoomAsset(int id) {
        return roomAssetsRepository.deleteRoomAsset(id);
    }

    @Override
    public RoomAssets findById(int id) {
        return roomAssetsRepository.findById(id);
    }

    @Override
    public List<RoomAssets> findByRoomId(String roomId) {
        return roomAssetsRepository.findByRoomId(roomId);
    }

    @Override
    public List<RoomAssets> findByAssetCode(String assetCode) {
        return roomAssetsRepository.findByAssetCode(assetCode);
    }
}

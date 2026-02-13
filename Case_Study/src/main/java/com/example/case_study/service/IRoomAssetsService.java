package com.example.case_study.service;

import com.example.case_study.entity.RoomAssets;
import java.util.List;

public interface IRoomAssetsService {

    List<RoomAssets> getAllRoomAssets();

    boolean addRoomAsset(RoomAssets asset);

    boolean updateRoomAsset(RoomAssets asset);

    boolean deleteRoomAsset(int id);

    RoomAssets findById(int id);

    List<RoomAssets> findByRoomId(String roomId);

    List<RoomAssets> findByAssetCode(String assetCode);
}

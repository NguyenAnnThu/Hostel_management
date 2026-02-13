package com.example.case_study.repository;

import com.example.case_study.entity.RoomAssets;
import java.util.List;

public interface IRoomAssetsRepository {

    List<RoomAssets> getAllRoomAssets();

    boolean addRoomAsset(RoomAssets asset);

    boolean updateRoomAsset(RoomAssets asset);

    boolean deleteRoomAsset(int id);

    RoomAssets findById(int id);

    List<RoomAssets> findByRoomId(String roomId);

    List<RoomAssets> findByAssetCode(String assetCode);
}

package com.example.case_study.repository;

import com.example.case_study.entity.Assets;

import java.util.List;

public interface IAssetsRepository {
    List<Assets> getAllAssets();

    boolean addAsset(Assets asset);

    boolean updateAsset(Assets asset);

    boolean deleteAsset(String assetCode);

    Assets findByCode(String assetCode);

    List<Assets> searchByName(String keyword);

    List<Assets> findByType(String type);

    boolean updateAvailableQuantity(String assetCode, int quantityChange);
}

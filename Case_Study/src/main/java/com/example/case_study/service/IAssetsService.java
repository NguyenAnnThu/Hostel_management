package com.example.case_study.service;

import com.example.case_study.entity.Assets;
import java.util.List;

public interface IAssetsService {

    List<Assets> getAllAssets();

    boolean addAsset(Assets asset);

    boolean updateAsset(Assets asset);

    boolean deleteAsset(String assetCode);

    Assets findByCode(String assetCode);

    List<Assets> searchByName(String keyword);

    List<Assets> findByType(String type);

    boolean updateAvailableQuantity(String assetCode, int quantityChange);
}

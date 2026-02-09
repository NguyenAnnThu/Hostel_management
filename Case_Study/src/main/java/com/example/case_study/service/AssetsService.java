package com.example.case_study.service;

import com.example.case_study.entity.Assets;
import com.example.case_study.repository.IAssetsRepository;
import com.example.case_study.repository.AssetsRepository;
import java.util.List;

public class AssetsService implements IAssetsService {

    private IAssetsRepository assetsRepository;

    public AssetsService() {
        assetsRepository = new AssetsRepository();
    }

    @Override
    public List<Assets> getAllAssets() {
        return assetsRepository.getAllAssets();
    }

    @Override
    public boolean addAsset(Assets asset) {
        return assetsRepository.addAsset(asset);
    }

    @Override
    public boolean updateAsset(Assets asset) {
        return assetsRepository.updateAsset(asset);
    }

    @Override
    public boolean deleteAsset(String assetCode) {
        return assetsRepository.deleteAsset(assetCode);
    }

    @Override
    public Assets findByCode(String assetCode) {
        return assetsRepository.findByCode(assetCode);
    }

    @Override
    public List<Assets> searchByName(String keyword) {
        return assetsRepository.searchByName(keyword);
    }

    @Override
    public List<Assets> findByType(String type) {
        return assetsRepository.findByType(type);
    }

    @Override
    public boolean updateAvailableQuantity(String assetCode, int quantityChange) {
        return assetsRepository.updateAvailableQuantity(assetCode, quantityChange);
    }
}

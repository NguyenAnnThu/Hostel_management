package com.example.case_study.repository;

import com.example.case_study.entity.Assets;

import java.util.ArrayList;
import java.util.List;

public class AssetsRepository implements IAssetsRepository{

    private List<Assets> assetsList;

    public AssetsRepository() {
        assetsList = new ArrayList<>();
    }

    // Lấy toàn bộ tài sản
    @Override
    public List<Assets> getAllAssets() {
        return assetsList;
    }

    // Thêm tài sản (không trùng mã)
    @Override
    public boolean addAsset(Assets asset) {
        if (asset == null || asset.getAssetCode() == null) return false;

        if (findByCode(asset.getAssetCode()) != null) {
            return false; // đã tồn tại
        }

        assetsList.add(asset);
        return true;
    }

    // Cập nhật tài sản
    @Override
    public boolean updateAsset(Assets asset) {
        if (asset == null) return false;

        for (int i = 0; i < assetsList.size(); i++) {
            if (assetsList.get(i).getAssetCode().equals(asset.getAssetCode())) {
                assetsList.set(i, asset);
                return true;
            }
        }
        return false;
    }

    // Xóa tài sản
    @Override
    public boolean deleteAsset(String assetCode) {
        return assetsList.removeIf(a -> a.getAssetCode().equals(assetCode));
    }

    // Tìm theo mã
    @Override
    public Assets findByCode(String assetCode) {
        for (Assets asset : assetsList) {
            if (asset.getAssetCode().equals(assetCode)) {
                return asset;
            }
        }
        return null;
    }

    // Tìm theo tên
    @Override
    public List<Assets> searchByName(String keyword) {
        List<Assets> result = new ArrayList<>();
        for (Assets asset : assetsList) {
            if (asset.getAssetName().toLowerCase().contains(keyword.toLowerCase())) {
                result.add(asset);
            }
        }
        return result;
    }

    // Lọc theo loại
    @Override
    public List<Assets> findByType(String type) {
        List<Assets> result = new ArrayList<>();
        for (Assets asset : assetsList) {
            if (asset.getAssetType().equalsIgnoreCase(type)) {
                result.add(asset);
            }
        }
        return result;
    }

    // Cập nhật số lượng còn lại (khi cấp phát cho phòng)
    @Override
    public boolean updateAvailableQuantity(String assetCode, int quantityChange) {
        Assets asset = findByCode(assetCode);
        if (asset == null) return false;

        int newQty = asset.getAvailableQuantity() + quantityChange;

        if (newQty < 0 || newQty > asset.getTotalQuantity()) {
            return false; // không hợp lệ
        }

        asset.setAvailableQuantity(newQty);
        return true;
    }
}

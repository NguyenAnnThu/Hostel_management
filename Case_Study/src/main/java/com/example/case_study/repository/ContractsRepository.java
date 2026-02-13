package com.example.case_study.repository;

import com.example.case_study.entity.Contracts;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ContractsRepository implements IContractsRepository {

    private List<Contracts> contractsList;

    public ContractsRepository() {
        contractsList = new ArrayList<>();
    }

    // Lấy tất cả hợp đồng
    @Override
    public List<Contracts> getAllContracts() {
        return contractsList;
    }

    // Thêm hợp đồng
    @Override
    public boolean addContract(Contracts contract) {
        if (contract == null) return false;

        if (findById(contract.getContractId()) != null) {
            return false; // trùng ID
        }

        contractsList.add(contract);
        return true;
    }

    // Cập nhật hợp đồng
    @Override
    public boolean updateContract(Contracts contract) {
        if (contract == null) return false;

        for (int i = 0; i < contractsList.size(); i++) {
            if (contractsList.get(i).getContractId() == contract.getContractId()) {
                contractsList.set(i, contract);
                return true;
            }
        }
        return false;
    }

    // Xóa hợp đồng
    @Override
    public boolean deleteContract(int contractId) {
        return contractsList.removeIf(c -> c.getContractId() == contractId);
    }

    // Tìm theo ID
    @Override
    public Contracts findById(int contractId) {
        for (Contracts c : contractsList) {
            if (c.getContractId() == contractId) {
                return c;
            }
        }
        return null;
    }

    // Tìm theo phòng
    @Override
    public List<Contracts> findByRoomId(String roomId) {
        List<Contracts> result = new ArrayList<>();
        for (Contracts c : contractsList) {
            if (c.getRoomId().equals(roomId)) {
                result.add(c);
            }
        }
        return result;
    }

    // Tìm theo khách thuê
    @Override
    public List<Contracts> findByCustomerId(String customerId) {
        List<Contracts> result = new ArrayList<>();
        for (Contracts c : contractsList) {
            if (c.getCustomerId().equals(customerId)) {
                result.add(c);
            }
        }
        return result;
    }

    // Lọc theo trạng thái
    @Override
    public List<Contracts> findByStatus(String status) {
        List<Contracts> result = new ArrayList<>();
        for (Contracts c : contractsList) {
            if (c.getStatus().equalsIgnoreCase(status)) {
                result.add(c);
            }
        }
        return result;
    }

    // Cập nhật trạng thái hợp đồng
    @Override
    public boolean updateStatus(int contractId, String status) {
        Contracts contract = findById(contractId);
        if (contract == null) return false;

        contract.setStatus(status);
        return true;
    }
}

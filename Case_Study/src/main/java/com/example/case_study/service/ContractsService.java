package com.example.case_study.service;

import com.example.case_study.entity.Contracts;
import com.example.case_study.repository.IContractsRepository;
import com.example.case_study.repository.ContractsRepository;
import java.util.List;

public class ContractsService implements IContractsService {

    private IContractsRepository contractsRepository;

    public ContractsService() {
        contractsRepository = new ContractsRepository();
    }

    @Override
    public List<Contracts> getAllContracts() {
        return contractsRepository.getAllContracts();
    }

    @Override
    public boolean addContract(Contracts contract) {
        return contractsRepository.addContract(contract);
    }

    @Override
    public boolean updateContract(Contracts contract) {
        return contractsRepository.updateContract(contract);
    }

    @Override
    public boolean deleteContract(int contractId) {
        return contractsRepository.deleteContract(contractId);
    }

    @Override
    public Contracts findById(int contractId) {
        return contractsRepository.findById(contractId);
    }

    @Override
    public List<Contracts> findByRoomId(String roomId) {
        return contractsRepository.findByRoomId(roomId);
    }

    @Override
    public List<Contracts> findByCustomerId(String customerId) {
        return contractsRepository.findByCustomerId(customerId);
    }

    @Override
    public List<Contracts> findByStatus(String status) {
        return contractsRepository.findByStatus(status);
    }

    @Override
    public boolean updateStatus(int contractId, String status) {
        return contractsRepository.updateStatus(contractId, status);
    }
}

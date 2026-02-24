package com.example.case_study.service;

import com.example.case_study.entity.Contracts;
import com.example.case_study.repository.ContractDtoRepository;
import dto.ContractDTO;

import java.time.LocalDate;
import java.util.List;

public class ContractsDtoService implements IContractDtoService {
    private ContractDtoRepository contractsRepo;
    public ContractsDtoService() {
        contractsRepo = new ContractDtoRepository();
    }
    @Override
    public List<ContractDTO> getAllContracts() {
        return contractsRepo.getAllContracts();
    }

    @Override
    public boolean updateContract(int id, String roomId, String customerId, LocalDate startDate, LocalDate endDate, double deposit, String status) {
        return contractsRepo.updateContract(id, roomId, customerId, startDate, endDate, deposit, status);
    }

    public boolean addContract(String roomId, String customerId,
                               LocalDate startDate, LocalDate endDate,
                               double deposit, String status) {
        return contractsRepo.addContract(roomId, customerId, startDate, endDate, deposit, status);
    }

    public boolean deleteContract(int id) {
        return contractsRepo.deleteContract(id);
    }
    public List<ContractDTO> filterContracts(String status, String roomId) {
        return contractsRepo.filterContracts(status, roomId);
    }
}

package com.example.case_study.service;

import com.example.case_study.entity.Contracts;
import dto.ContractDTO;

import java.time.LocalDate;
import java.util.List;

public interface IContractDtoService {
    List<ContractDTO> getAllContracts();

    boolean updateContract(int id, String roomId, String customerId, LocalDate startDate, LocalDate endDate, double deposit, String status);
}

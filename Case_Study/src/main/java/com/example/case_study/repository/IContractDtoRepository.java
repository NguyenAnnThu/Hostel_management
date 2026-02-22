package com.example.case_study.repository;

import com.example.case_study.entity.Contracts;
import dto.ContractDTO;

import java.time.LocalDate;
import java.util.List;

public interface IContractDtoRepository {
    List<ContractDTO> getAllContracts();

    // Cập nhật hợp đồng
    boolean updateContract(int id, String roomId, String customerId, LocalDate startDate, LocalDate endDate, double deposit, String status);
}

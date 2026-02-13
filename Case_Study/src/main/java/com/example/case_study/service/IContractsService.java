package com.example.case_study.service;

import com.example.case_study.entity.Contracts;
import java.util.List;

public interface IContractsService {

    List<Contracts> getAllContracts();

    boolean addContract(Contracts contract);

    boolean updateContract(Contracts contract);

    boolean deleteContract(int contractId);

    Contracts findById(int contractId);

    List<Contracts> findByRoomId(String roomId);

    List<Contracts> findByCustomerId(String customerId);

    List<Contracts> findByStatus(String status);

    boolean updateStatus(int contractId, String status);
}

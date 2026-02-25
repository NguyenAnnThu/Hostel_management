package com.example.case_study.repository;

import com.example.case_study.entity.Invoices;

import java.util.List;

public interface IInvoicesRepository {

    int save(Invoices invoice); // trả về invoiceId
    List<Invoices> findAll();
    List<Invoices> filter(Integer month, Integer year, String status, String roomId, String invoiceId);
    Invoices findById(int invoiceId);
    List<String> getAllStatus();
    List<String> getAllRoomId();
}

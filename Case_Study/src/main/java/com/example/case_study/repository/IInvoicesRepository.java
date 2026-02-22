package com.example.case_study.repository;

import com.example.case_study.entity.Invoices;

import java.util.List;

public interface IInvoicesRepository {

    int save(Invoices invoice); // trả về invoiceId
    List<Invoices> findAll();
    Invoices findById(int invoiceId);
}

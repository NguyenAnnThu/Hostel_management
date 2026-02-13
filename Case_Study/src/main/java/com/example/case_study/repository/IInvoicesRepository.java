package com.example.case_study.repository;

import com.example.case_study.entity.Invoices;

import java.util.List;

public interface IInvoicesRepository {

    List<Invoices> getAllInvoices();

    boolean addInvoice(Invoices invoice);

    boolean updateInvoice(Invoices invoice);

    boolean deleteInvoice(int invoiceId);

    Invoices findById(int invoiceId);

    List<Invoices> findByRoomId(String roomId);

    List<Invoices> findByCustomerId(String customerId);

    List<Invoices> findByMonthYear(int month, int year);

    boolean updateStatus(int invoiceId, String status);
}

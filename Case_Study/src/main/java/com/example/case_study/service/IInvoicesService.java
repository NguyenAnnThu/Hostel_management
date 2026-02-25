package com.example.case_study.service;

import com.example.case_study.dto.ContractOption;
import com.example.case_study.entity.InvoiceDetails;
import com.example.case_study.entity.Invoices;
import java.util.List;

public interface IInvoicesService {

    void createInvoice(Invoices invoice, List<InvoiceDetails> details);
    List<Invoices> getAll();
    Invoices findById(int invoiceId);
    List<String> getAllStatus();
    List<String> getAllRoomId();
    List<Invoices> filter(Integer month, Integer year, String status, String roomId, String invoiceId);
    List<ContractOption> getActiveContracts();
}

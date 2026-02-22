package com.example.case_study.service;

import com.example.case_study.entity.InvoiceDetails;
import com.example.case_study.entity.Invoices;
import com.example.case_study.repository.IInvoiceDetailsRepository;
import com.example.case_study.repository.IInvoicesRepository;
import com.example.case_study.repository.InvoiceDetailsRepository;
import com.example.case_study.repository.InvoicesRepository;
import java.util.List;

public class InvoicesService implements IInvoicesService {

    private final IInvoicesRepository invoicesRepo = new InvoicesRepository();
    private final IInvoiceDetailsRepository detailsRepo = new InvoiceDetailsRepository();

    @Override
    public void createInvoice(Invoices invoice, List<InvoiceDetails> details) {
        int invoiceId = invoicesRepo.save(invoice);
        if (invoiceId <= 0) {
            throw new RuntimeException("Create invoice failed");
        }
        detailsRepo.saveAll(invoiceId, details);
    }

    @Override
    public List<Invoices> getAll() {
        return invoicesRepo.findAll();
    }
    @Override
    public Invoices findById(int invoiceId) {
        return invoicesRepo.findById(invoiceId);
    }
}

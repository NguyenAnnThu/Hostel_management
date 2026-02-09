package com.example.case_study.service;

import com.example.case_study.entity.InvoiceDetails;
import com.example.case_study.repository.IInvoiceDetailsRepository;
import com.example.case_study.repository.InvoiceDetailsRepository;
import java.util.List;

public class InvoiceDetailsService implements IInvoiceDetailsService {

    private IInvoiceDetailsRepository invoiceDetailsRepository;

    public InvoiceDetailsService() {
        invoiceDetailsRepository = new InvoiceDetailsRepository();
    }

    @Override
    public List<InvoiceDetails> getAllDetails() {
        return invoiceDetailsRepository.getAllDetails();
    }

    @Override
    public boolean addDetail(InvoiceDetails detail) {
        return invoiceDetailsRepository.addDetail(detail);
    }

    @Override
    public boolean updateDetail(InvoiceDetails detail) {
        return invoiceDetailsRepository.updateDetail(detail);
    }

    @Override
    public boolean deleteDetail(int detailId) {
        return invoiceDetailsRepository.deleteDetail(detailId);
    }

    @Override
    public InvoiceDetails findById(int detailId) {
        return invoiceDetailsRepository.findById(detailId);
    }

    @Override
    public List<InvoiceDetails> findByInvoiceId(int invoiceId) {
        return invoiceDetailsRepository.findByInvoiceId(invoiceId);
    }

    @Override
    public double calculateInvoiceTotal(int invoiceId) {
        return invoiceDetailsRepository.calculateInvoiceTotal(invoiceId);
    }
}

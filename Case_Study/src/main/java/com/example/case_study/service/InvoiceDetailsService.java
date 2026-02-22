package com.example.case_study.service;

import com.example.case_study.entity.InvoiceDetails;
import com.example.case_study.repository.IInvoiceDetailsRepository;
import com.example.case_study.repository.InvoiceDetailsRepository;

import java.util.List;

public class InvoiceDetailsService implements IInvoiceDetailsService {

    private final IInvoiceDetailsRepository invoiceDetailsRepository =
            new InvoiceDetailsRepository();

    @Override
    public void saveInvoiceDetails(int invoiceId, List<InvoiceDetails> details) {

        if (details == null || details.isEmpty()) {
            return; // không có chi tiết thì không lưu
        }

        invoiceDetailsRepository.saveAll(invoiceId, details);
    }

    @Override
    public List<InvoiceDetails> findByInvoiceId(int invoiceId) {
        return invoiceDetailsRepository.findByInvoiceId(invoiceId);
    }

}
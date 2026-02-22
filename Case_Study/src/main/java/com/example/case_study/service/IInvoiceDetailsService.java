package com.example.case_study.service;

import com.example.case_study.entity.InvoiceDetails;
import java.util.List;

public interface IInvoiceDetailsService {

    void saveInvoiceDetails(int invoiceId, List<InvoiceDetails> details);
    List<InvoiceDetails> findByInvoiceId(int invoiceId);
}
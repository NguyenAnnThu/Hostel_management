package com.example.case_study.repository;

import com.example.case_study.entity.InvoiceDetails;
import java.util.List;

public interface IInvoiceDetailsRepository {

    void saveAll(int invoiceId, List<InvoiceDetails> details);
    List<InvoiceDetails> findByInvoiceId(int invoiceId);
}

package com.example.case_study.service;

import com.example.case_study.entity.InvoiceDetails;
import java.util.List;

public interface IInvoiceDetailsService {

    List<InvoiceDetails> getAllDetails();

    boolean addDetail(InvoiceDetails detail);

    boolean updateDetail(InvoiceDetails detail);

    boolean deleteDetail(int detailId);

    InvoiceDetails findById(int detailId);

    List<InvoiceDetails> findByInvoiceId(int invoiceId);

    double calculateInvoiceTotal(int invoiceId);
}

package com.example.case_study.service;

import com.example.case_study.entity.PaymentConfirmations;
import java.util.List;

public interface IPaymentConfirmationsService {

    List<PaymentConfirmations> getAllConfirmations();

    boolean addConfirmation(PaymentConfirmations confirmation);

    boolean deleteConfirmation(int confirmationId);

    PaymentConfirmations findById(int confirmationId);

    List<PaymentConfirmations> findByInvoiceId(int invoiceId);

    boolean isInvoiceConfirmed(int invoiceId);
}

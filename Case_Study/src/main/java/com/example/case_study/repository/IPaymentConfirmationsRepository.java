package com.example.case_study.repository;

import com.example.case_study.entity.PaymentConfirmations;
import java.util.List;

public interface IPaymentConfirmationsRepository {

    List<PaymentConfirmations> getAllConfirmations();

    boolean addConfirmation(PaymentConfirmations confirmation);

    boolean deleteConfirmation(int confirmationId);

    PaymentConfirmations findById(int confirmationId);

    List<PaymentConfirmations> findByInvoiceId(int invoiceId);

    boolean isInvoiceConfirmed(int invoiceId);
}

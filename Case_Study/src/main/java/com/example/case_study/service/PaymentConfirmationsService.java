package com.example.case_study.service;

import com.example.case_study.entity.PaymentConfirmations;
import com.example.case_study.repository.IPaymentConfirmationsRepository;
import com.example.case_study.repository.PaymentConfirmationsRepository;
import java.util.List;

public class PaymentConfirmationsService implements IPaymentConfirmationsService {

    private IPaymentConfirmationsRepository paymentConfirmationsRepository;

    public PaymentConfirmationsService() {
        paymentConfirmationsRepository = new PaymentConfirmationsRepository();
    }

    @Override
    public List<PaymentConfirmations> getAllConfirmations() {
        return paymentConfirmationsRepository.getAllConfirmations();
    }

    @Override
    public boolean addConfirmation(PaymentConfirmations confirmation) {
        return paymentConfirmationsRepository.addConfirmation(confirmation);
    }

    @Override
    public boolean deleteConfirmation(int confirmationId) {
        return paymentConfirmationsRepository.deleteConfirmation(confirmationId);
    }

    @Override
    public PaymentConfirmations findById(int confirmationId) {
        return paymentConfirmationsRepository.findById(confirmationId);
    }

    @Override
    public List<PaymentConfirmations> findByInvoiceId(int invoiceId) {
        return paymentConfirmationsRepository.findByInvoiceId(invoiceId);
    }

    @Override
    public boolean isInvoiceConfirmed(int invoiceId) {
        return paymentConfirmationsRepository.isInvoiceConfirmed(invoiceId);
    }
}

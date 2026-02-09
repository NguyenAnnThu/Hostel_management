package com.example.case_study.repository;

import com.example.case_study.entity.PaymentConfirmations;

import java.util.ArrayList;
import java.util.List;

public class PaymentConfirmationsRepository implements IPaymentConfirmationsRepository {

    private List<PaymentConfirmations> confirmationList;

    public PaymentConfirmationsRepository() {
        confirmationList = new ArrayList<>();
    }

    // Lấy tất cả xác nhận
    @Override
    public List<PaymentConfirmations> getAllConfirmations() {
        return confirmationList;
    }

    // Thêm xác nhận thanh toán
    @Override
    public boolean addConfirmation(PaymentConfirmations confirmation) {
        if (confirmation == null) return false;

        if (findById(confirmation.getConfirmationId()) != null) {
            return false; // trùng ID
        }

        confirmationList.add(confirmation);
        return true;
    }

    // Xóa xác nhận
    @Override
    public boolean deleteConfirmation(int confirmationId) {
        return confirmationList.removeIf(c -> c.getConfirmationId() == confirmationId);
    }

    // Tìm theo ID
    @Override
    public PaymentConfirmations findById(int confirmationId) {
        for (PaymentConfirmations c : confirmationList) {
            if (c.getConfirmationId() == confirmationId) {
                return c;
            }
        }
        return null;
    }

    // Lấy xác nhận theo hóa đơn
    @Override
    public List<PaymentConfirmations> findByInvoiceId(int invoiceId) {
        List<PaymentConfirmations> result = new ArrayList<>();
        for (PaymentConfirmations c : confirmationList) {
            if (c.getInvoiceId() == invoiceId) {
                result.add(c);
            }
        }
        return result;
    }

    // Kiểm tra hóa đơn đã được xác nhận thanh toán chưa
    @Override
    public boolean isInvoiceConfirmed(int invoiceId) {
        for (PaymentConfirmations c : confirmationList) {
            if (c.getInvoiceId() == invoiceId) {
                return true;
            }
        }
        return false;
    }
}

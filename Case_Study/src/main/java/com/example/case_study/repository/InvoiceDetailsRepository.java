package com.example.case_study.repository;

import com.example.case_study.entity.InvoiceDetails;

import java.util.ArrayList;
import java.util.List;

public class InvoiceDetailsRepository implements IInvoiceDetailsRepository {

    private List<InvoiceDetails> detailsList;

    public InvoiceDetailsRepository() {
        detailsList = new ArrayList<>();
    }

    // Lấy tất cả chi tiết
    @Override
    public List<InvoiceDetails> getAllDetails() {
        return detailsList;
    }

    // Thêm chi tiết hóa đơn
    @Override
    public boolean addDetail(InvoiceDetails detail) {
        if (detail == null) return false;

        if (findById(detail.getInvoiceDetailId()) != null) {
            return false; // trùng ID
        }

        detailsList.add(detail);
        return true;
    }

    // Cập nhật chi tiết
    @Override
    public boolean updateDetail(InvoiceDetails detail) {
        if (detail == null) return false;

        for (int i = 0; i < detailsList.size(); i++) {
            if (detailsList.get(i).getInvoiceDetailId() == detail.getInvoiceDetailId()) {
                detailsList.set(i, detail);
                return true;
            }
        }
        return false;
    }

    // Xóa chi tiết
    @Override
    public boolean deleteDetail(int detailId) {
        return detailsList.removeIf(d -> d.getInvoiceDetailId() == detailId);
    }

    // Tìm theo ID
    @Override
    public InvoiceDetails findById(int detailId) {
        for (InvoiceDetails d : detailsList) {
            if (d.getInvoiceDetailId() == detailId) {
                return d;
            }
        }
        return null;
    }

    // Lấy chi tiết theo hóa đơn
    @Override
    public List<InvoiceDetails> findByInvoiceId(int invoiceId) {
        List<InvoiceDetails> result = new ArrayList<>();
        for (InvoiceDetails d : detailsList) {
            if (d.getInvoiceId() == invoiceId) {
                result.add(d);
            }
        }
        return result;
    }

    // Tính tổng tiền hóa đơn
    @Override
    public double calculateInvoiceTotal(int invoiceId) {
        double total = 0;
        for (InvoiceDetails d : detailsList) {
            if (d.getInvoiceId() == invoiceId) {
                total += d.getQuantity() * d.getUnitPrice();
            }
        }
        return total;
    }
}

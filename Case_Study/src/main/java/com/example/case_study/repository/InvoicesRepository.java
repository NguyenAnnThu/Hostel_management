package com.example.case_study.repository;

import com.example.case_study.entity.Invoices;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class InvoicesRepository implements IInvoicesRepository {

    private List<Invoices> invoicesList;

    public InvoicesRepository() {
        invoicesList = new ArrayList<>();
    }

    // Lấy tất cả hóa đơn
    @Override
    public List<Invoices> getAllInvoices() {
        return invoicesList;
    }

    // Thêm hóa đơn
    @Override
    public boolean addInvoice(Invoices invoice) {
        if (invoice == null) return false;

        if (findById(invoice.getInvoiceId()) != null) {
            return false; // trùng ID
        }

        invoicesList.add(invoice);
        return true;
    }

    // Cập nhật hóa đơn
    @Override
    public boolean updateInvoice(Invoices invoice) {
        if (invoice == null) return false;

        for (int i = 0; i < invoicesList.size(); i++) {
            if (invoicesList.get(i).getInvoiceId() == invoice.getInvoiceId()) {
                invoicesList.set(i, invoice);
                return true;
            }
        }
        return false;
    }

    // Xóa hóa đơn
    @Override
    public boolean deleteInvoice(int invoiceId) {
        return invoicesList.removeIf(i -> i.getInvoiceId() == invoiceId);
    }

    // Tìm theo ID
    @Override
    public Invoices findById(int invoiceId) {
        for (Invoices i : invoicesList) {
            if (i.getInvoiceId() == invoiceId) {
                return i;
            }
        }
        return null;
    }

    // Tìm theo phòng
    @Override
    public List<Invoices> findByRoomId(String roomId) {
        List<Invoices> result = new ArrayList<>();
        for (Invoices i : invoicesList) {
            if (i.getRoomId().equals(roomId)) {
                result.add(i);
            }
        }
        return result;
    }

    // Tìm theo khách
    @Override
    public List<Invoices> findByCustomerId(String customerId) {
        List<Invoices> result = new ArrayList<>();
        for (Invoices i : invoicesList) {
            if (i.getCustomerId().equals(customerId)) {
                result.add(i);
            }
        }
        return result;
    }

    // Lọc theo tháng/năm
    @Override
    public List<Invoices> findByMonthYear(int month, int year) {
        List<Invoices> result = new ArrayList<>();
        for (Invoices i : invoicesList) {
            if (i.getMonth() == month && i.getYear() == year) {
                result.add(i);
            }
        }
        return result;
    }

    // Cập nhật trạng thái hóa đơn
    @Override
    public boolean updateStatus(int invoiceId, String status) {
        Invoices invoice = findById(invoiceId);
        if (invoice == null) return false;

        invoice.setStatus(status);
        return true;
    }
}

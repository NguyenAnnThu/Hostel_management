package com.example.case_study.service;

import com.example.case_study.entity.Invoices;
import com.example.case_study.repository.IInvoicesRepository;
import com.example.case_study.repository.InvoicesRepository;
import java.util.List;

public class InvoicesService implements IInvoicesService {

    private IInvoicesRepository invoicesRepository;

    public InvoicesService() {
        invoicesRepository = new InvoicesRepository();
    }

    @Override
    public List<Invoices> getAllInvoices() {
        return invoicesRepository.getAllInvoices();
    }

    @Override
    public boolean addInvoice(Invoices invoice) {
        return invoicesRepository.addInvoice(invoice);
    }

    @Override
    public boolean updateInvoice(Invoices invoice) {
        return invoicesRepository.updateInvoice(invoice);
    }

    @Override
    public boolean deleteInvoice(int invoiceId) {
        return invoicesRepository.deleteInvoice(invoiceId);
    }

    @Override
    public Invoices findById(int invoiceId) {
        return invoicesRepository.findById(invoiceId);
    }

    @Override
    public List<Invoices> findByRoomId(String roomId) {
        return invoicesRepository.findByRoomId(roomId);
    }

    @Override
    public List<Invoices> findByCustomerId(String customerId) {
        return invoicesRepository.findByCustomerId(customerId);
    }

    @Override
    public List<Invoices> findByMonthYear(int month, int year) {
        return invoicesRepository.findByMonthYear(month, year);
    }

    @Override
    public boolean updateStatus(int invoiceId, String status) {
        return invoicesRepository.updateStatus(invoiceId, status);
    }
}

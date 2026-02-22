package com.example.case_study.repository;

import com.example.case_study.entity.Account;

import java.util.ArrayList;
import java.util.List;

public class AccountRepository implements IAccountRepository {

    private List<Account> accounts;

    public AccountRepository() {
        accounts = new ArrayList<>();
    }

    // Lấy toàn bộ tài khoản
    @Override
    public List<Account> getAllAccounts() {
        return accounts;
    }

    // Thêm tài khoản (phone là duy nhất)
    @Override
    public boolean addAccount(Account account) {
        if (account == null || account.getPhone() == null) return false;

        if (findAccountByPhone(account.getPhone()) != null) {
            return false; // trùng số điện thoại
        }

        accounts.add(account);
        return true;
    }

    // Xóa tài khoản theo phone
    @Override
    public boolean deleteAccount(String phone) {
        if (phone == null) return false;
        return accounts.removeIf(a -> a.getPhone().equals(phone));
    }

    // Cập nhật tài khoản
    @Override
    public boolean updateAccount(Account account) {
        if (account == null || account.getPhone() == null) return false;

        for (int i = 0; i < accounts.size(); i++) {
            if (accounts.get(i).getPhone().equals(account.getPhone())) {
                accounts.set(i, account);
                return true;
            }
        }
        return false;
    }

    // Tìm theo tên (ở đây coi name = phone nếu hệ thống chưa có username)
    @Override
    public Account findAccountByName(String name) {
        if (name == null) return null;

        for (Account account : accounts) {
            if (account.getPhone().equalsIgnoreCase(name)) {
                return account;
            }
        }
        return null;
    }

    // Tìm theo số điện thoại
    @Override
    public Account findAccountByPhone(String phone) {
        if (phone == null) return null;

        for (Account account : accounts) {
            if (account.getPhone().equals(phone)) {
                return account;
            }
        }
        return null;
    }
}

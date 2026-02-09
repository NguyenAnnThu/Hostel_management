package com.example.case_study.service;

import com.example.case_study.entity.Account;
import com.example.case_study.repository.IAccountRepository;
import com.example.case_study.repository.AccountRepository;
import java.util.List;

public class AccountService implements IAccountService {

    private IAccountRepository accountRepository;

    public AccountService() {
        accountRepository = new AccountRepository();
    }

    @Override
    public List<Account> getAllAccounts() {
        return accountRepository.getAllAccounts();
    }

    @Override
    public boolean addAccount(Account account) {
        return accountRepository.addAccount(account);
    }

    @Override
    public boolean deleteAccount(String phone) {
        return accountRepository.deleteAccount(phone);
    }

    @Override
    public boolean updateAccount(Account account) {
        return accountRepository.updateAccount(account);
    }

    @Override
    public Account findAccountByName(String name) {
        return accountRepository.findAccountByName(name);
    }

    @Override
    public Account findAccountByPhone(String phone) {
        return accountRepository.findAccountByPhone(phone);
    }
}

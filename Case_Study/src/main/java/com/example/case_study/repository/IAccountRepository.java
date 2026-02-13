package com.example.case_study.repository;

import com.example.case_study.entity.Account;

import java.util.List;

public interface IAccountRepository {
    List<Account> getAllAccounts();
    boolean addAccount(Account account);
    boolean deleteAccount(String phone);
    boolean updateAccount(Account account);
    Account findAccountByName(String name);
    Account findAccountByPhone(String phone);

}

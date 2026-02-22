package com.example.case_study.repository;

import com.example.case_study.entity.Account;
import com.example.case_study.entity.User;

import java.util.List;

public interface IAccountRepository {
    Account login(String phone, String password);
    Account findByPhone(String phone);
    boolean existsByPhone(String phone);
    void register(User user, Account account);
    String getMaxUserId();
    void updatePassword(String phone, String password);
}

package com.example.case_study.service;

import com.example.case_study.entity.Account;

import java.util.Date;
import java.util.List;

public interface IAccountService {

    Account login(String phone, String password);
    Account getByPhone(String phone);
    String register(String fullName, String phone, String email,
                    String citizenId, String address, Date dob, String password);
    String resetPassword(String phone, String newPassword);
}

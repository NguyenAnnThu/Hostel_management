package com.example.case_study.service;

import com.example.case_study.entity.Account;
import com.example.case_study.entity.User;
import com.example.case_study.repository.IAccountRepository;
import com.example.case_study.repository.AccountRepository;
import org.mindrot.jbcrypt.BCrypt;

import java.util.Date;
import java.util.List;
import java.util.Random;

public class AccountService implements IAccountService {
        private final IAccountRepository repository = new AccountRepository();

        @Override
        public Account login(String phone, String password) {
            return repository.login(phone, password);
        }

    @Override
    public Account getByPhone(String phone) {
        return repository.findByPhone(phone);
    }

    @Override
    public String register(String fullName, String phone, String email,
                           String citizenId, String address, Date dob, String rawPassword) {

        if (repository.existsByPhone(phone)) {
            return "Số điện thoại đã tồn tại";
        }

        User user = new User();
        user.setUserId(generateUserId());
        user.setFullName(fullName);
        user.setPhone(phone);
        user.setEmail(email);
        user.setCitizenId(citizenId);
        user.setAddress(address);
        user.setDateOfBirth(dob);
        user.setStatus("active");

        Account account = new Account();
        account.setPhone(phone);
        account.setPassword(BCrypt.hashpw(rawPassword, BCrypt.gensalt()));
        account.setRole("TENANT");
        account.setUser(user);

        repository.register(user, account);
        return null;
    }

    private String generateUserId() {
        String maxId = repository.getMaxUserId(); // U00010
        if (maxId == null) {
            return "U00001";
        }
        int num = Integer.parseInt(maxId.substring(1));
        return "U" + String.format("%05d", num + 1);
    }

    @Override
    public String resetPassword(String phone, String newPassword) {
        if (!repository.existsByPhone(phone)) {
            return "Số điện thoại không tồn tại";
        }

        String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        repository.updatePassword(phone, hashed);

        return null;
    }

}

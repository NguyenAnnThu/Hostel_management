package com.example.case_study.service;

import com.example.case_study.entity.User;
import java.util.List;

public interface IUserService {

    List<User> getAll();

    boolean add(User user);

    boolean update(User user);

    boolean delete(String userId);

    User findById(String userId);

    List<User> findByName(String name);

    User findByPhone(String phone);

    List<User> findByStatus(String status);
}

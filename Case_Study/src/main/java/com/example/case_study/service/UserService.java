package com.example.case_study.service;

import com.example.case_study.entity.User;
import com.example.case_study.repository.IUserRepository;
import com.example.case_study.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {

    private IUserRepository userRepository;

    public UserService() {
        userRepository = new UserRepository();
    }

    @Override
    public List<User> getAll() {
        return userRepository.getAll();
    }

    @Override
    public boolean add(User user) {
        return userRepository.add(user);
    }

    @Override
    public boolean update(User user) {
        return userRepository.update(user);
    }

    @Override
    public boolean delete(String userId) {
        return userRepository.delete(userId);
    }

    @Override
    public User findById(String userId) {
        return userRepository.findById(userId);
    }

    @Override
    public List<User> findByName(String name) {
        return userRepository.findByName(name);
    }

    @Override
    public User findByPhone(String phone) {
        return userRepository.findByPhone(phone);
    }

    @Override
    public List<User> findByStatus(String status) {
        return userRepository.findByStatus(status);
    }
}

package com.example.case_study.service;

import com.example.case_study.entity.User;
import com.example.case_study.repository.IUserRepository;
import com.example.case_study.repository.UserRepository;
import dto.UserDto;

import java.util.List;

public class UserService implements IUserService {

    private IUserRepository userRepository;

    public UserService() {
        userRepository = new UserRepository();
    }

    @Override
    public List<UserDto> getAll() {
        return userRepository.getAll();
    }

    @Override
    public boolean add(UserDto user) {
        return userRepository.add(user);
    }

    @Override
    public boolean update(UserDto user) {
        return userRepository.update(user);
    }

    @Override
    public boolean delete(String userId) {
        return userRepository.delete(userId);
    }

    @Override
    public UserDto findById(String userId) {
        return userRepository.findById(userId);
    }

    @Override
    public boolean updateStatus(String userId, String status) {
        return userRepository.updateStatus(userId, status);
    }
    @Override
    public List<UserDto> filter(String status, String keyword) {
        return userRepository.filter(status, keyword);
    }
}

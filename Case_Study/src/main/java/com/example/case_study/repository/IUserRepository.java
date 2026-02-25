package com.example.case_study.repository;

import com.example.case_study.entity.User;
import dto.UserDto;

import java.util.List;

public interface IUserRepository {
    List<UserDto> getAll();

    boolean add(UserDto user);

    boolean update(UserDto user);

    boolean updateStatus(String userId, String status);

    boolean delete(String userId);

    UserDto findById(String userId);

    List<UserDto> filter(String status, String keyword);
}

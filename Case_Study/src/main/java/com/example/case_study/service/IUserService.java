package com.example.case_study.service;

import com.example.case_study.entity.User;
import dto.UserDto;

import java.util.List;

public interface IUserService {

    List<UserDto> getAll();

    boolean add(UserDto user);

    boolean update(UserDto user);

    boolean delete(String userId);

    UserDto findById(String userId);

    boolean updateStatus(String userId, String status);

    List<UserDto> filter(String status, String keyword);
}

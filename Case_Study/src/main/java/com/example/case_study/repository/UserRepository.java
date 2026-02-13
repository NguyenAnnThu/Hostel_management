package com.example.case_study.repository;

import com.example.case_study.entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    private List<User> userList = new ArrayList<>();

    @Override
    public List<User> getAll() {
        return userList;
    }

    @Override
    public boolean add(User user) {
        if (user == null) return false;

        if (findById(user.getUserId()) != null) return false;   // trùng ID
        if (findByPhone(user.getPhone()) != null) return false; // trùng SĐT

        userList.add(user);
        return true;
    }

    @Override
    public boolean update(User user) {
        User existing = findById(user.getUserId());
        if (existing == null) return false;

        existing.setFullName(user.getFullName());
        existing.setPhone(user.getPhone());
        existing.setEmail(user.getEmail());
        existing.setCitizenId(user.getCitizenId());
        existing.setAddress(user.getAddress());
        existing.setDateOfBirth(user.getDateOfBirth());
        existing.setStatus(user.getStatus());
        return true;
    }

    @Override
    public boolean delete(String userId) {
        return userList.removeIf(u -> u.getUserId().equalsIgnoreCase(userId));
    }

    @Override
    public User findById(String userId) {
        for (User u : userList) {
            if (u.getUserId().equalsIgnoreCase(userId)) {
                return u;
            }
        }
        return null;
    }

    @Override
    public List<User> findByName(String name) {
        List<User> result = new ArrayList<>();
        for (User u : userList) {
            if (u.getFullName().toLowerCase().contains(name.toLowerCase())) {
                result.add(u);
            }
        }
        return result;
    }

    @Override
    public User findByPhone(String phone) {
        for (User u : userList) {
            if (u.getPhone().equals(phone)) {
                return u;
            }
        }
        return null;
    }

    @Override
    public List<User> findByStatus(String status) {
        List<User> result = new ArrayList<>();
        for (User u : userList) {
            if (u.getStatus().equalsIgnoreCase(status)) {
                result.add(u);
            }
        }
        return result;
    }
}

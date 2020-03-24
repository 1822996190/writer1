package com.writer1.service;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface UserService {
    public int queryByUsername(String username);
    public int queryByUsernameAndPassword(String username, String password);
    public String getPassword(String username);
    public int addUser(String username, String password);
    public String queryIs_valid(String username);
    public String queryRole_permissions(String username);
    public String queryTitle( int offset, int rows) throws JsonProcessingException;
}

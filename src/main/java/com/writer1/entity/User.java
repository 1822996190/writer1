package com.writer1.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private Integer id;

    private String username;

    private String password;
    private String role_permissions;
    private String is_valid;

    public User(String username, String password,String role_permissions,String is_valid) {
        this.username = username;
        this.password = password;
        this.role_permissions=role_permissions;
        this.is_valid=is_valid;
    }
    public User(String username, String password){
        this.username = username;
        this.password = password;
    }

    public User() {

    }
}

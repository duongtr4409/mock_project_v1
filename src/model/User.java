/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author tuanc
 */
public class User {
    private int id;
    private String userName;
    private String password;
    private boolean authority;

    public User() {
    }

    public User(String userName, String password, boolean authority) {
        this.userName = userName;
        this.password = password;
        this.authority = authority;
    }

    public User(int id, String userName, String password, boolean authority) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.authority = authority;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAuthority() {
        return authority;
    }

    public void setAuthority(boolean authority) {
        this.authority = authority;
    }

    public Object[] toArray() {
        return new Object[]{userName, password, authority};
    }
}

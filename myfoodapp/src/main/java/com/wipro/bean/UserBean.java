package com.wipro.bean;

public class UserBean {
    private String userName;
    private String password;
    private String email;
    private String phnumber;
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
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public UserBean(String userName, String password) {
        this.userName = userName;
        this.password = password;
        this.email = "";
        this.phnumber = "";
    }
    public String getPhnumber() {
        return phnumber;
    }
    public UserBean() {
    }
    public void setPhnumber(String phnumber) {
        this.phnumber = phnumber;
    }
   

}

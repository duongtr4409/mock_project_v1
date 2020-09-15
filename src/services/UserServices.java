/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.impl.UserDAOImpl;
import java.util.List;
import model.User;

/**
 *
 * @author tuanc
 */
public class UserServices {

    public static List<User> getAllUser() {
        return UserDAOImpl.getInstance().getAllUser();
    }

    public static User getUserByName(String userName) {
        return UserDAOImpl.getInstance().getUserByName(userName);
    }

    public static boolean checkLogin(String userName, String password) {
        List<User> dataUser = null;
        try {
            dataUser = UserServices.getAllUser();
            int len = dataUser.size();
            for (int i = 0; i < len; i++) {
                if (userName.equalsIgnoreCase(dataUser.get(i).getUserName())) {
                    return password.equals(dataUser.get(i).getPassword());
                }
            }
        } catch (Exception e) {
        }
        return false;
    }

    public static boolean checkAuthority(String userName) {
        List<User> dataUser = null;
        try {
            dataUser = UserServices.getAllUser();
            int len = dataUser.size();
            for (int i = 0; i < len; i++) {
                if (userName.equalsIgnoreCase(dataUser.get(i).getUserName())) {
                    return dataUser.get(i).isAuthority();
                }
            }
        } catch (Exception e) {
        }
        return false;
    }
}

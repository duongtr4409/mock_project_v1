/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author tuanc
 */
public class UserMapper implements DBMapper<User> {

    private static UserMapper userMapper;

    public static UserMapper getInstance() {
        if (userMapper == null) {
            userMapper = new UserMapper();
        }
        return userMapper;
    }

    @Override
    public User mapRow(ResultSet rs) {
        User user = null;
        try {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setUserName(rs.getString("userName"));
            user.setPassword(rs.getString("password"));
            user.setAuthority(rs.getBoolean("isAdmin"));
            return user;
        } catch (SQLException e) {
            return null;
        }
    }
}

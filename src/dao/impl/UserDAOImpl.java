/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import dao.UserDAO;
import java.util.List;
import model.User;
import utils.mappers.UserMapper;

/**
 *
 * @author tuanc
 */
public class UserDAOImpl extends UtilsDAO<User> implements UserDAO {

    private static UserDAOImpl userDAOImpl;

    public static UserDAOImpl getInstance() {
        if (userDAOImpl == null) {
            userDAOImpl = new UserDAOImpl();
        }
        return userDAOImpl;
    }

    @Override
    public List<User> getAllUser() {
        String sql = "SELECT * FROM tbl_User";
        return query(sql, UserMapper.getInstance());
    }

    @Override
    public User getUserByName(String userName) {
        String sql = "SELECT * FROM tbl_User WHERE userName = '" + userName + "';";
        List<User> listUser = query(sql, new UserMapper());
        if (listUser == null || listUser.isEmpty()) {
            return null;
        } else {
            return listUser.get(0);
        }
    }
}

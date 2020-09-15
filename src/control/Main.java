/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.util.List;
import model.User;
import services.BookCaseServices;
import services.UserServices;
import view.LoginView;

/**
 *
 * @author tuanc
 */
public class Main {

    static LoginView loginView = new LoginView();

    public static void main(String[] args) {
        loginView.setVisible(true);
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.impl.BookDAOImpl;
import dao.impl.ContainDAOImpl;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.Book;

/**
 *
 * @author ACER
 */
public class AdminServices {

    public static Integer createBook(Book book) throws SQLException {
        return BookDAOImpl.getInstance().insert(book);
    }

    public static void deleteBook(int book_id) throws SQLException {
        if (!BookServices.checkBook(book_id)) {
            JOptionPane.showMessageDialog(null, "This book is not exist!");
        } else {
            ContainDAOImpl.getInstance().deleteContain(book_id);
            BookDAOImpl.getInstance().deleteBook(book_id);

        }
    }

    public static void updateContentBook(int book_id, String content) throws SQLException {
        if (!BookServices.checkBook(book_id)) {
            JOptionPane.showMessageDialog(null, "This book is not exist!");
        } else {
            BookDAOImpl.getInstance().updateContentBook(book_id, content);
        }
    }
}

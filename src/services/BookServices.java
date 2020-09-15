/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.impl.BookDAOImpl;
import java.sql.SQLException;
import java.util.List;
import model.Book;

/**
 *
 * @author tuanc
 */
public class BookServices {

    public static List<Book> getAllBook() {
        return BookDAOImpl.getInstance().getAll();
    }

    public static List<Book> searchByOption(String option, String input) {
        return BookDAOImpl.getInstance().searchByOption(option, input);
    }

    public static Book getABook(int book_id) throws SQLException {
        return BookDAOImpl.getInstance().findByID(book_id);
    }

    public static Book readABook(int id) {
        Book book = BookDAOImpl.getInstance().findByID(id);
        if (book != null) {
            return book;
        }
        return null;
    }

    public static boolean checkBook(int book_id) throws SQLException {
        return BookDAOImpl.getInstance().checkBook(book_id);
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Book;
import model.Contain;

/**
 *
 * @author tuanc
 */
public interface BookDAO {

    Integer insert(Book book);

    List<Book> getAll();

    List<Book> findBookOfBookCase(int bookCaseID);

    List<Book> searchByOption(String option, String input);

    Book findByID(int id);

    Integer deleteBook(int bookID);

    boolean checkBook(int book_id);

    void updateContentBook(int book_id, String content);

}

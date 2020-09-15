/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.BookCase;
import model.User;

/**
 *
 * @author tuanc
 */
public interface BookCaseDAO {

    BookCase findOne(int id);

    Integer insert(User user);

    Integer removeByBookCaseID(int bookCaseID);

    Integer removeByBookCaeIDBookID(int bookCaseID, int bookID);
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import dao.BookCaseDAO;
import java.util.List;
import model.BookCase;
import model.User;
import utils.mappers.BookCaseMapper;

/**
 *
 * @author Administrator
 */
public class BookCaseDAOImpl extends UtilsDAO<BookCase> implements BookCaseDAO{

    private static BookCaseDAOImpl bookCaseDAOImpl;

    public static BookCaseDAOImpl getInstance() {
        if (bookCaseDAOImpl == null) {
            bookCaseDAOImpl = new BookCaseDAOImpl();
        }
        return bookCaseDAOImpl;
    }

    /* 
	 *	lấy BookCase tương ứng với User
     */
    @Override
    public BookCase findOne(int id) {
        String sql = "SELECT * FROM dbo.BookCase WHERE book_case_id = ?";
        List<BookCase> listBookCase = query(sql, new BookCaseMapper(), id);
        if (listBookCase == null || listBookCase.isEmpty()) {
            return null;
        } else {
            BookCase bookCase = listBookCase.get(0);
            // Lấy danh sách Book tương ứng trong BookCase
            bookCase.setListBook(BookDAOImpl.getInstance().findBookOfBookCase(id));
            return bookCase;
        }
    }

    /*
	 *	thêm BookCase mới vào Database
     */
    @Override
    public Integer insert(User user) {
        String bookCaseName = "BookCase of " + user.getUserName();
        String sql = "INSERT INTO dbo.BookCase(book_case_id, book_case_name) VALUES(?, ?)";
        return insert(sql, user.getId(), bookCaseName);
    }

    @Override
    public Integer removeByBookCaseID(int bookCaseID) {
        String sql = "DELETE FROM dbo.Contain WHERE book_case_id = ?";
        return removeOrUpdate(sql, bookCaseID);
    }

    /*
	 * Xóa Contain dựa trên BookCaseID và BookID
	 * phục vụ chức năng 'Edit BookCase' -> 'Remove a book'
     */
    @Override
    public Integer removeByBookCaeIDBookID(int bookCaseID, int bookID) {
        String sql = "DELETE FROM dbo.Contain WHERE book_case_id = ? AND book_id = ?";
        return removeOrUpdate(sql, bookCaseID, bookID);
    }
}

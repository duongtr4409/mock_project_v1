/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import dao.BookDAO;
import java.util.List;
import model.Book;
import utils.mappers.BookMapper;

/**
 *
 * @author Administrator
 */
public class BookDAOImpl extends UtilsDAO<Book> implements BookDAO {

    private static BookDAOImpl bookDAOImpl;

    /*
	 *	tránh việc phải khởi tạo đối tượng quá nhiều lần 
     */
    public static BookDAOImpl getInstance() {
        if (bookDAOImpl == null) {
            bookDAOImpl = new BookDAOImpl();
        }
        return bookDAOImpl;
    }

    @Override
    public Integer insert(Book book) {
        String sql = "INSERT INTO dbo.tbl_Book(bookTitle , author, brief, publisher, content, category) "
                + "VALUES(N'"
                + book.getBookTitle()
                + "', N'" + book.getAuthor()
                + "', N'" + book.getBrief()
                + "', N'" + book.getPublisher()
                + "', N'" + book.getContent()
                + "', N'" + book.getCategory() + "')";
        return insert(sql);
    }

    /*
	 * lấy danh sách Book tương ứng với BookCase
	 * phục vụ chức năng 'View BookCase'
     */
    @Override
    public List<Book> findBookOfBookCase(int bookCaseID) {
        StringBuilder sql = new StringBuilder("SELECT b.* ");
        sql.append("FROM dbo.Contain AS c JOIN dbo.tbl_Book AS b ON c.book_id = b.book_id ");
        sql.append("WHERE c.book_case_id = ?");
        List<Book> listBookOfBookCase = query(sql.toString(), BookMapper.getInstance(), bookCaseID);
        return listBookOfBookCase;
    }

    @Override
    public Book findByID(int id) {
        String sql = "SELECT * FROM dbo.tbl_Book WHERE book_id = ?";
        List<Book> listBook = query(sql, new BookMapper(), id);
        if (listBook == null || listBook.isEmpty()) {
            return null;
        } else {
            return listBook.get(0);
        }
    }

    @Override
    public Integer deleteBook(int bookID) {
        String sql = "DELETE FROM dbo.tbl_Book WHERE book_id = ?";
        return removeOrUpdate(sql, bookID);
    }

    @Override
    public List<Book> getAll() {
        String sql = "SELECT * FROM tbl_Book";
        return query(sql, BookMapper.getInstance());
    }

    @Override
    public List<Book> searchByOption(String option, String input) {
        String sql = "SELECT * FROM tbl_Book WHERE " + option + " LIKE N'%" + input + "%'";
        return query(sql, BookMapper.getInstance());
    }

    @Override
    public boolean checkBook(int book_id) {
        String sql = "IF EXISTS(SELECT * FROM dbo.tbl_Book WHERE book_id = " + book_id + " ) BEGIN  SELECT 1 END";
        List<Book> listBook = query(sql, new BookMapper());
        if (listBook == null || listBook.isEmpty()) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public void updateContentBook(int book_id, String content) {
        String sql = "UPDATE dbo.tbl_Book SET content = N'" + content + "' WHERE book_id = " + book_id;
        removeOrUpdate(sql);
    }

}

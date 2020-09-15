/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.Book;

/**
 *
 * @author Administrator
 */
public class BookMapper implements DBMapper<Book> {

    private static BookMapper bookMapper;

    public static BookMapper getInstance() {
        if (bookMapper == null) {
            bookMapper = new BookMapper();
        }
        return bookMapper;
    }

    @Override
    public Book mapRow(ResultSet rs) {
        Book book = new Book();
        try {
            book.setId(rs.getInt("book_id"));
            book.setAuthor(rs.getString("author"));
            book.setCategory(rs.getString("category"));
            book.setBrief(rs.getString("brief"));
            book.setBookTitle(rs.getString("bookTitle"));
            book.setPublisher(rs.getString("publisher"));
            book.setContent(rs.getString("content"));
            return book;
        } catch (SQLException e) {
            return null;
        }
    }

}

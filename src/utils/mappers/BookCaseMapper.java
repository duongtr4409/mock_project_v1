/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.BookCase;

/**
 *
 * @author Administrator
 */
public class BookCaseMapper implements DBMapper<BookCase> {

    private static BookCaseMapper bookCaseMapper;
    
    public static BookCaseMapper getInstance(){
        if(bookCaseMapper == null){
            bookCaseMapper = new BookCaseMapper();
        }
        return bookCaseMapper;
    }
    
    @Override
    public BookCase mapRow(ResultSet rs) {
    BookCase bookCase = new BookCase();
        try {
            bookCase.setId(rs.getInt("book_case_id"));
            bookCase.setBookCaseName(rs.getString("book_case_name"));
            return bookCase;
        } catch (SQLException e) {
            return null;
        }
    }

   

//    @Override
//    public BookCase mapRow(ResultSet rs) {
//        BookCase bookCase = new BookCase();
//        try {
//            bookCase.setId(rs.getInt("BookCaseID"));
//            bookCase.setBookCaseName(rs.getString("BookCaseName"));
//            return bookCase;
//        } catch (SQLException e) {
//            return null;
//        }
//    }
}

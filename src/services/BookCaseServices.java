/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.impl.BookCaseDAOImpl;
import dao.impl.BookDAOImpl;
import dao.impl.ContainDAOImpl;
import java.util.List;
import model.Book;
import model.BookCase;
import model.Contain;
import model.User;

/**
 *
 * @author Administrator
 */
public class BookCaseServices {

    public static List<Book> viewBookCase(User user) {
        BookCase myBookCase = BookCaseDAOImpl.getInstance().findOne(user.getId());
        return myBookCase == null ? null : myBookCase.getListBook();
    }

    public static String addBookToBookCase(User user, int idBook) {
        try {
            //nếu User chưa từng có BookCase thì thêm mới BookCase vào trong DATABASE
            BookCase myBookCase = BookCaseDAOImpl.getInstance().findOne(user.getId());

            if (myBookCase == null) {
                BookCaseDAOImpl.getInstance().insert(user);
                myBookCase = BookCaseDAOImpl.getInstance().findOne(user.getId());
            }
            //Kiểm tra xem idBook có tồn tại trong DATABASE không
            Book book = BookDAOImpl.getInstance().findByID(idBook);
            if (book != null) {
                if (!myBookCase.getListBook().contains(book)) {
                    // thực hiện thêm
                    Integer containID = ContainDAOImpl.getInstance().insert(new Contain(myBookCase.getId(), idBook));
                    if (containID != null) { // TH thêm thành công
                        return "Add successfully!";
                    } else {// TH lỗi trong quá trình thêm
                        return "Add failed!";
                    }
                } else {// TH bookID đã có trong BookCase
                    return "Book already exist in the BookCase!";
                }
            } else {
                throw new Exception();
            }
        } catch (Exception e) {
            //Xử lý nếu idBook không tồn tại trong DATABASE
            return "Add failed!(id not exist)";
        }
    }

    public static String removeBookFromBookCase(User user, int bookIDRemove) {
        //Lấy BookCase tương ứng với User đã đang nhập
        BookCase myBookCase = BookCaseDAOImpl.getInstance().findOne(user.getId());
        if (myBookCase == null || myBookCase.getListBook().isEmpty()) { // TH BookCase của User đang trống
            return "Your BookCase is empty!";
        } else {
            try {
                // Tìm trong BookCase xem có Book nào có ID tương ứng với bookIDRemove không
                Book book = myBookCase.getListBook().stream().filter(b -> b.getId() == bookIDRemove).findFirst().get();
                if (book != null) {
                    Integer countRemove = BookCaseDAOImpl.getInstance()
                            .removeByBookCaeIDBookID(myBookCase.getId(), book.getId());
                    if (countRemove != null) {
                        return "Remove is successfully!";
                    } else {// TH lỗi trong quá trình xóa
                        return "Remove failed!";
                    }
                } else { // TH trong BookCase không có
                    throw new Exception();

                }
            } catch (Exception e) {
                return "id not exist your BookCase!";
            }
        }
    }

    public static String clearBookCase(User user) {
        //Lấy BookCase tương ứng với User đã đang nhập
        BookCase myBookCase = BookCaseDAOImpl.getInstance().findOne(user.getId());
        if (myBookCase != null && !myBookCase.getListBook().isEmpty()) { // Kiểm tra User có BookCase không
            Integer countRemove = BookCaseDAOImpl.getInstance().removeByBookCaseID(myBookCase.getId());
            if (countRemove != null) {
                return "Clear successfully!\nYour BookCase is empty!";
            } else { // TH xảy ra lỗi trong quá trình Clear
                return "Clear failed!";
            }
        } else { // TH User không có BookCase
            return "Your BookCase is empty!";
        }
    }
}

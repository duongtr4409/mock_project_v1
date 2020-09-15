/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import dao.ContainDAO;
import model.Contain;

/**
 *
 * @author Administrator
 */
public class ContainDAOImpl extends UtilsDAO<Contain> implements ContainDAO{
    
    private static ContainDAOImpl containDAOImpl;
    
    public static ContainDAOImpl getInstance(){
        if(containDAOImpl == null){
            containDAOImpl = new ContainDAOImpl();
        }
        return  containDAOImpl;
    }
    
    /*
	 *	Thêm Contain mới vào trong Database
	 *  phục vụ chức năng 'Edit BookCase' -> 'Add a new book'
     */
    @Override
    public Integer insert(Contain contain) {
        String sql = "INSERT INTO dbo.Contain VALUES(?, ?,GETDATE())";
        return insert(sql, contain.getBookCaseID(), contain.getBookID());
    }

    /*
	 * Xóa danh sách Contain dựa trên BookCaseID
	 * phục vụ chức năng 'Edit BookCase' -> 'Clear BookCase'
     */
    
    @Override
    public void deleteContain(int book_id) {
      String  sql = "DELETE FROM dbo.Contain WHERE book_id = " + book_id;
        removeOrUpdate(sql);
    }
}

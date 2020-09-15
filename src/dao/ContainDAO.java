/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Contain;

/**
 *
 * @author tuanc
 */
public interface ContainDAO {

    Integer insert(Contain contain);

    void deleteContain(int book_id);
}

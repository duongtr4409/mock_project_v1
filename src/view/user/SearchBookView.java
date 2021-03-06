/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view.user;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JMenuItem;
import model.Book;
import services.BookServices;

/**
 *
 * @author tuanc
 */
public class SearchBookView extends javax.swing.JFrame {

    List<Book> dataBook = new ArrayList<>();

    /**
     * Creates new form SearBookView
     */
    public SearchBookView() {
        initComponents();
        this.setLocationRelativeTo(null);
        init();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblResultSearch = new javax.swing.JTable();
        labelSearch = new javax.swing.JLabel();
        edtSearch = new javax.swing.JTextField();
        btnSearch = new javax.swing.JButton();
        jLabelResultSearch = new javax.swing.JLabel();
        btnBack = new javax.swing.JButton();
        jMenuBar1 = new javax.swing.JMenuBar();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 24)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("SEARCH BOOK");

        tblResultSearch.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "STT", "ID", "Tilte", "Author", "Biref", "Publisher", "Category"
            }
        ));
        jScrollPane1.setViewportView(tblResultSearch);
        if (tblResultSearch.getColumnModel().getColumnCount() > 0) {
            tblResultSearch.getColumnModel().getColumn(0).setHeaderValue("STT");
            tblResultSearch.getColumnModel().getColumn(1).setHeaderValue("ID");
            tblResultSearch.getColumnModel().getColumn(2).setHeaderValue("Tilte");
            tblResultSearch.getColumnModel().getColumn(3).setHeaderValue("Author");
            tblResultSearch.getColumnModel().getColumn(4).setHeaderValue("Biref");
            tblResultSearch.getColumnModel().getColumn(5).setHeaderValue("Publisher");
            tblResultSearch.getColumnModel().getColumn(6).setHeaderValue("Category");
        }

        labelSearch.setText("Search by Name");

        edtSearch.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                edtSearchActionPerformed(evt);
            }
        });

        btnSearch.setText("Search");
        btnSearch.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSearchActionPerformed(evt);
            }
        });

        jLabelResultSearch.setFont(new java.awt.Font("Times New Roman", 3, 18)); // NOI18N
        jLabelResultSearch.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabelResultSearch.setText("Result Search by Name");

        btnBack.setText("Back");
        btnBack.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBackActionPerformed(evt);
            }
        });
        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(342, 342, 342)
                        .addComponent(labelSearch, javax.swing.GroupLayout.PREFERRED_SIZE, 148, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(edtSearch, javax.swing.GroupLayout.PREFERRED_SIZE, 186, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btnSearch)
                        .addGap(0, 399, Short.MAX_VALUE))
                    .addComponent(jLabelResultSearch, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(btnBack)
                .addGap(556, 556, 556))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 76, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(labelSearch)
                    .addComponent(edtSearch, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnSearch))
                .addGap(15, 15, 15)
                .addComponent(jLabelResultSearch)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 382, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 21, Short.MAX_VALUE)
                .addComponent(btnBack)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnBackActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBackActionPerformed
        this.dispose();
//        new MenuUserView().setVisible(true);
    }//GEN-LAST:event_btnBackActionPerformed

    private void btnSearchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSearchActionPerformed

        String input = edtSearch.getText();
        switch (labelSearch.getText()) {

            case "Search by Author": {
                dataBook = BookServices.searchByOption("author", edtSearch.getText());
                ViewListBook.showListBook(dataBook, jScrollPane1, tblResultSearch);
                break;
            }
            case "Search by Category": {
                dataBook = BookServices.searchByOption("category", edtSearch.getText());
                ViewListBook.showListBook(dataBook, jScrollPane1, tblResultSearch);
                break;
            }
            default: {
                dataBook = BookServices.searchByOption("bookTitle", edtSearch.getText());
                ViewListBook.showListBook(dataBook, jScrollPane1, tblResultSearch);
                break;
            }

        }
    }//GEN-LAST:event_btnSearchActionPerformed

    private void edtSearchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_edtSearchActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_edtSearchActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {

        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(SearchBookView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(SearchBookView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(SearchBookView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(SearchBookView.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                SearchBookView searchBookView = new SearchBookView();
                searchBookView.setVisible(true);

//                searchBookView.test();
            }
        });

    }

    private void init() {
        MyMenuItem searchByNameItem = new MyMenuItem("Search by Name");
        jMenuBar1.add(searchByNameItem);
        MyMenuItem searchByAuthorItem = new MyMenuItem("Search by Author");
        jMenuBar1.add(searchByAuthorItem);
        MyMenuItem searchByCategoryItem = new MyMenuItem("Search by Category");
        jMenuBar1.add(searchByCategoryItem);

    }

    private class MyMenuItem extends JMenuItem implements ActionListener {

        public MyMenuItem(String text) {
            super(text);
            addActionListener(this);
        }

        @Override
        public void actionPerformed(ActionEvent e) {
            edtSearch.setText("");
            ViewListBook.showListBook(null, jScrollPane1, tblResultSearch);
            System.out.println("Item clicked: " + e.getActionCommand());
            labelSearch.setText(e.getActionCommand());
            jLabelResultSearch.setText("Result " + e.getActionCommand());
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBack;
    private javax.swing.JButton btnSearch;
    private javax.swing.JTextField edtSearch;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabelResultSearch;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel labelSearch;
    private javax.swing.JTable tblResultSearch;
    // End of variables declaration//GEN-END:variables
}

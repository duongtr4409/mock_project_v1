/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import javax.swing.JOptionPane;
import services.UserServices;
import view.admin.CreateBookView;
import view.admin.DeleteBookView;
import view.admin.UpdateBookView;

/**
 *
 * @author tuanc
 */
public final class MenuAdminView extends javax.swing.JFrame {

    String UserName;

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    /**
     * Creates new form MenuAdminView
     *
     * @param userName
     */
    public MenuAdminView(String userName) {
        setUserName(userName);
        initComponents();
        jLabelUserName.setText("Welcome " + userName);
        this.setLocationRelativeTo(null);
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
        btnCreateBook = new javax.swing.JButton();
        btnUpdateContentBook = new javax.swing.JButton();
        btnDeleteBook = new javax.swing.JButton();
        btnBack = new javax.swing.JButton();
        jLabelUserName = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 36)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Reading Book Management System");

        btnCreateBook.setFont(new java.awt.Font("Times New Roman", 3, 24)); // NOI18N
        btnCreateBook.setText("Create Book");
        btnCreateBook.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCreateBookActionPerformed(evt);
            }
        });

        btnUpdateContentBook.setFont(new java.awt.Font("Times New Roman", 3, 24)); // NOI18N
        btnUpdateContentBook.setText("Update Content Book");
        btnUpdateContentBook.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnUpdateContentBookActionPerformed(evt);
            }
        });

        btnDeleteBook.setFont(new java.awt.Font("Times New Roman", 3, 24)); // NOI18N
        btnDeleteBook.setText("Delete Book");
        btnDeleteBook.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDeleteBookActionPerformed(evt);
            }
        });

        btnBack.setText("Back");
        btnBack.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBackActionPerformed(evt);
            }
        });

        jLabelUserName.setFont(new java.awt.Font("Times New Roman", 3, 18)); // NOI18N
        jLabelUserName.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabelUserName.setText("Ahihi");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(125, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(btnDeleteBook, javax.swing.GroupLayout.PREFERRED_SIZE, 696, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnUpdateContentBook, javax.swing.GroupLayout.PREFERRED_SIZE, 696, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnCreateBook, javax.swing.GroupLayout.PREFERRED_SIZE, 696, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(105, 105, 105))
            .addGroup(layout.createSequentialGroup()
                .addGap(405, 405, 405)
                .addComponent(btnBack, javax.swing.GroupLayout.PREFERRED_SIZE, 106, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(48, 48, 48)
                .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, 878, Short.MAX_VALUE))
            .addComponent(jLabelUserName, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jLabelUserName, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(53, 53, 53)
                .addComponent(btnCreateBook, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(47, 47, 47)
                .addComponent(btnUpdateContentBook, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(40, 40, 40)
                .addComponent(btnDeleteBook, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(45, 45, 45)
                .addComponent(btnBack, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 75, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCreateBookActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCreateBookActionPerformed
        if (!UserServices.checkAuthority(UserName)) {
            JOptionPane.showMessageDialog(null, "You Do not Access! ");
            return;
        }
        new CreateBookView(UserName).setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnCreateBookActionPerformed

    private void btnUpdateContentBookActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnUpdateContentBookActionPerformed
        if (!UserServices.checkAuthority(UserName)) {
            JOptionPane.showMessageDialog(null, "You Do not Access!");
            return;
        }
        new UpdateBookView(UserName).setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnUpdateContentBookActionPerformed

    private void btnDeleteBookActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeleteBookActionPerformed
        if (!UserServices.checkAuthority(UserName)) {
            JOptionPane.showMessageDialog(null, "You Do not Access!");
            return;
        }
        new DeleteBookView(UserName).setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnDeleteBookActionPerformed

    private void btnBackActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBackActionPerformed
//        new MenuView().setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnBackActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBack;
    private javax.swing.JButton btnCreateBook;
    private javax.swing.JButton btnDeleteBook;
    private javax.swing.JButton btnUpdateContentBook;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabelUserName;
    // End of variables declaration//GEN-END:variables
}

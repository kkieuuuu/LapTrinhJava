/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Frm;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;
import Main.Main;
import static Main.Main.frmTC;
import java.awt.Color;
import javax.swing.JOptionPane;
/**
 *
 * @author Admin
 */
public class FrmQuanLyVe extends javax.swing.JFrame {

    /**
     * Creates new form FrmQuanLyVe
     */
    public FrmQuanLyVe() {
        initComponents();
        LaydulieuVe();
    }

    public void LaydulieuVe() {
        String cautruyvan = "";
        cautruyvan = "Select * from tbThongTinChiTietVe ";
        ResultSet rs = Main.connection.ExcuteQueryGetTable(cautruyvan);
        Object[] obj = new Object[]{"Mã Vé", "Mã Chuyến Bay","Mã Máy Bay", "Mã Hạng Vé",  "Tình Trạng Vé"};
        DefaultTableModel tableModel = new DefaultTableModel(obj, 0);
        jTable1.setModel(tableModel);
        try {
            while (rs.next()) {
                Object[] item = new Object[5];
                item[0] = rs.getString("MaVe");
                item[1] = rs.getString("MaCB");
                item[2] = rs.getString("MaMB");
                item[3] = rs.getString("MaHV");
                item[4] = rs.getString("TinhTrangve");
                tableModel.addRow(item);
            }
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }    
        
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        lblMaVe = new javax.swing.JLabel();
        lblMaChuyenBay = new javax.swing.JLabel();
        lblMaMB = new javax.swing.JLabel();
        lblMaHangVe = new javax.swing.JLabel();
        lblTinhTrangVe = new javax.swing.JLabel();
        btnFresh = new javax.swing.JButton();
        btnAdd = new javax.swing.JButton();
        btnDelete = new javax.swing.JButton();
        btnFix = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jLabel7 = new javax.swing.JLabel();
        txtMaVe = new javax.swing.JTextField();
        txtMaChuyenBay = new javax.swing.JTextField();
        txtMaMB = new javax.swing.JTextField();
        txtMaHangVe = new javax.swing.JTextField();
        txtTinhTrangVe = new javax.swing.JTextField();
        btnThoat = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("THÔNG TIN VÉ MÁY BAY");

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setFont(new java.awt.Font("Consolas", 1, 14)); // NOI18N

        jLabel2.setFont(new java.awt.Font("Impact", 2, 48)); // NOI18N
        jLabel2.setText("THÔNG TIN VÉ MÁY BAY");

        lblMaVe.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        lblMaVe.setText("Mã Vé:");

        lblMaChuyenBay.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        lblMaChuyenBay.setText("Mã Chuyến Bay:");

        lblMaMB.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        lblMaMB.setText("Mã Máy Bay:");

        lblMaHangVe.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        lblMaHangVe.setText("Mã Hạng Vé:");

        lblTinhTrangVe.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        lblTinhTrangVe.setText("Tình Trạng Vé");

        btnFresh.setBackground(new java.awt.Color(0, 0, 0));
        btnFresh.setFont(new java.awt.Font("Tahoma", 3, 18)); // NOI18N
        btnFresh.setForeground(new java.awt.Color(255, 255, 255));
        btnFresh.setText("Tạo Mới");
        btnFresh.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnFreshActionPerformed(evt);
            }
        });

        btnAdd.setBackground(new java.awt.Color(0, 0, 0));
        btnAdd.setFont(new java.awt.Font("Tahoma", 3, 18)); // NOI18N
        btnAdd.setForeground(new java.awt.Color(255, 255, 255));
        btnAdd.setText("Thêm");
        btnAdd.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAddActionPerformed(evt);
            }
        });

        btnDelete.setBackground(new java.awt.Color(0, 0, 0));
        btnDelete.setFont(new java.awt.Font("Tahoma", 3, 18)); // NOI18N
        btnDelete.setForeground(new java.awt.Color(255, 255, 255));
        btnDelete.setText("Xóa");
        btnDelete.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDeleteActionPerformed(evt);
            }
        });

        btnFix.setBackground(new java.awt.Color(0, 0, 0));
        btnFix.setFont(new java.awt.Font("Tahoma", 3, 18)); // NOI18N
        btnFix.setForeground(new java.awt.Color(255, 255, 255));
        btnFix.setText("Sửa");
        btnFix.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnFixActionPerformed(evt);
            }
        });

        jTable1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Mã Vé", "Mã Chuyến Bay", "Mã Máy Bay", "Mã Hạng Vé", "Tình Trạng Vé"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        jLabel7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/logo.png"))); // NOI18N
        jLabel7.setText(" ");

        txtMaMB.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtMaMBActionPerformed(evt);
            }
        });

        txtMaHangVe.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtMaHangVeActionPerformed(evt);
            }
        });

        txtTinhTrangVe.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtTinhTrangVeActionPerformed(evt);
            }
        });

        btnThoat.setBackground(new java.awt.Color(0, 0, 0));
        btnThoat.setFont(new java.awt.Font("Tahoma", 3, 18)); // NOI18N
        btnThoat.setForeground(new java.awt.Color(255, 255, 255));
        btnThoat.setText("Thoát");
        btnThoat.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThoatActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 558, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(37, 37, 37)
                                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 439, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(63, 63, 63)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(lblMaVe, javax.swing.GroupLayout.PREFERRED_SIZE, 117, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(lblMaChuyenBay))
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addGap(18, 18, 18)
                                        .addComponent(txtMaChuyenBay, javax.swing.GroupLayout.PREFERRED_SIZE, 116, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                        .addGap(18, 18, 18)
                                        .addComponent(txtMaVe, javax.swing.GroupLayout.PREFERRED_SIZE, 116, javax.swing.GroupLayout.PREFERRED_SIZE))))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(lblMaMB, javax.swing.GroupLayout.PREFERRED_SIZE, 117, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(lblMaHangVe, javax.swing.GroupLayout.PREFERRED_SIZE, 117, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addGap(18, 18, 18)
                                        .addComponent(txtMaHangVe, javax.swing.GroupLayout.PREFERRED_SIZE, 116, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                        .addGap(18, 18, 18)
                                        .addComponent(txtMaMB, javax.swing.GroupLayout.PREFERRED_SIZE, 116, javax.swing.GroupLayout.PREFERRED_SIZE))))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addComponent(lblTinhTrangVe, javax.swing.GroupLayout.PREFERRED_SIZE, 112, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(23, 23, 23)
                                .addComponent(txtTinhTrangVe, javax.swing.GroupLayout.PREFERRED_SIZE, 116, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(61, 61, 61)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnAdd, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnDelete, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnFix, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnFresh, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnThoat, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap(53, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(22, 22, 22)
                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 56, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(14, 14, 14)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblMaVe)
                            .addComponent(txtMaVe, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblMaChuyenBay)
                            .addComponent(txtMaChuyenBay, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblMaMB)
                            .addComponent(txtMaMB, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(11, 11, 11)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblMaHangVe)
                            .addComponent(txtMaHangVe, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblTinhTrangVe)
                            .addComponent(txtTinhTrangVe, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(btnFresh)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnAdd)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnDelete)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnFix)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnThoat)))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(31, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

   
    public boolean KiemTraNhapVe(int ts) {
        boolean kiemtra = false;
        String MaVe,MaCB,MaMB,MaHV,TinhTrangve;
        MaVe=txtMaVe.getText();
        MaCB= txtMaChuyenBay.getText();
        MaMB=txtMaMB.getText();
        MaHV=txtMaHangVe.getText();
        TinhTrangve=txtTinhTrangVe.getText();
        String  ThongBao = "";
        
        if (MaVe.equals("") && ts == 1) {
            ThongBao += "Bạn Chưa nhập Mã Vé\n";
            lblMaVe.setForeground(Color.red);
        }
        if (MaCB.equals("")) {
            ThongBao += "Bạn chưa Nhập Mã Chuyến Bay\n";
            lblMaChuyenBay.setForeground(Color.red);
        }
        if (MaMB.equals("")) {
            lblMaMB.setForeground(Color.red);
            ThongBao += "Bạn chưa Nhập Mã Máy Bay\n";
        }
        if (MaHV.equals("")) {
            lblMaHangVe.setForeground(Color.red);
            ThongBao += "Bạn chưa Nhập Mã Hạng Vé\n";
        }
        if (TinhTrangve.equals("")) {
            ThongBao += "Bạn chưa Nhập Tình Trạng Vé\n";
            lblTinhTrangVe.setForeground(Color.red);
        }
        if (ThongBao.equals("")) {
            kiemtra = true;
            lblMaVe.setForeground(Color.black);
            lblMaChuyenBay.setForeground(Color.black);
            lblMaMB.setForeground(Color.black);
            lblMaHangVe.setForeground(Color.black);
            lblTinhTrangVe.setForeground(Color.black);
        } else {
            kiemtra = false;
            frmTC.ThongBao(ThongBao, "LỖI NHẬP LIỆU", 2);
        }
        return kiemtra;
    }
    
    
    
    private void txtMaMBActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtMaMBActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtMaMBActionPerformed

    private void txtMaHangVeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtMaHangVeActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtMaHangVeActionPerformed

    private void txtTinhTrangVeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtTinhTrangVeActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtTinhTrangVeActionPerformed

    private void btnFreshActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnFreshActionPerformed
        txtMaVe.setText("");
        txtMaChuyenBay.setText("");
        txtMaMB.setText("");
        txtMaHangVe.setText("");
        txtTinhTrangVe.setText("");
        LaydulieuVe();
    }//GEN-LAST:event_btnFreshActionPerformed

    private void btnAddActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAddActionPerformed
        String MaVe,MaCB,MaMB,MaHV,TinhTrangve;
        MaVe=txtMaVe.getText();
        MaCB= txtMaChuyenBay.getText();
        MaMB=txtMaMB.getText();
        MaHV=txtMaHangVe.getText();
        TinhTrangve=txtTinhTrangVe.getText();
        String cautruyvan = "INSERT INTO tbThongTinChiTietVe(MaVe,MaCB,MaMB,MaHV,TinhTrangVe)  Values('" + MaVe + "',N'" + MaCB + "',N'" + MaMB + "','" + MaHV + "',N'" + TinhTrangve + "')";
        
        boolean kiemtra = KiemTraNhapVe(0);
        if (kiemtra) {
            Main.connection.ExcuteQueryUpdateDB(cautruyvan);
            Main.frmTC.infoBox("Thành Công !!!", "Thông báo");
            System.out.println("Đã Thêm Thành Công");
            System.out.println(cautruyvan);
        } else {
            System.out.println("Thất Bại");
        }
        LaydulieuVe();
    }//GEN-LAST:event_btnAddActionPerformed

    private void btnDeleteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDeleteActionPerformed
        String MaVe,MaCB,MaMB,MaHV,TinhTrangve;
        MaVe=txtMaVe.getText();
        MaCB= txtMaChuyenBay.getText();
        MaMB=txtMaMB.getText();
        MaHV=txtMaHangVe.getText();
        TinhTrangve=txtTinhTrangVe.getText();
        String cautruyvan = "update tbThongTinChiTietVe set MaCB = N'" + MaCB +
                "',MaMB ='" + MaMB + "',MaHV=N'" + MaHV+"',TinhTrangve =N'" + TinhTrangve + "' WHERE MaVe='" + MaVe + "';";
        boolean kiemtra = KiemTraNhapVe(0);
        if (kiemtra) {
            Main.connection.ExcuteQueryUpdateDB(cautruyvan);
            Main.frmTC.infoBox("Thành Công !!!", "Thông báo");
            System.out.println("Đã Sửa Thành Công");
            System.out.println(cautruyvan);
        } else {
            System.out.println("Thất Bại");
        }
        LaydulieuVe();
    }//GEN-LAST:event_btnDeleteActionPerformed

    private void btnFixActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnFixActionPerformed
        String MaVe = txtMaVe.getText();
        String cautruyvan = "delete tbThongTinChiTietVe where MaVe='" + MaVe+"';";
        boolean kiemtra = KiemTraNhapVe(0);
        if (kiemtra) {
            Main.connection.ExcuteQueryUpdateDB(cautruyvan);
            System.out.println("Đã Xóa Thành Công");
            Main.frmTC.infoBox("Thành Công !!!", "Thông báo");
            System.out.println(cautruyvan);
        } else {
            System.out.println("Thất Bại");
        }
        LaydulieuVe();
    }//GEN-LAST:event_btnFixActionPerformed

    private void btnThoatActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThoatActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnThoatActionPerformed

    
        
    
    
    
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
            java.util.logging.Logger.getLogger(FrmQuanLyVe.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmQuanLyVe.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmQuanLyVe.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmQuanLyVe.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmQuanLyVe().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAdd;
    private javax.swing.JButton btnDelete;
    private javax.swing.JButton btnFix;
    private javax.swing.JButton btnFresh;
    private javax.swing.JButton btnThoat;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JLabel lblMaChuyenBay;
    private javax.swing.JLabel lblMaHangVe;
    private javax.swing.JLabel lblMaMB;
    private javax.swing.JLabel lblMaVe;
    private javax.swing.JLabel lblTinhTrangVe;
    private javax.swing.JTextField txtMaChuyenBay;
    private javax.swing.JTextField txtMaHangVe;
    private javax.swing.JTextField txtMaMB;
    private javax.swing.JTextField txtMaVe;
    private javax.swing.JTextField txtTinhTrangVe;
    // End of variables declaration//GEN-END:variables
}

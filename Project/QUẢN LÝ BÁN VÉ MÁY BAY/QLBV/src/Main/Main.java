/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Main;

import Frm.FrmSignIn;
import Frm.FrmMenu;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Main {
    public static  Frm.FrmMenu frmTC =new Frm.FrmMenu();
    public static database.ConnectToSQL connection = new  database.ConnectToSQL ();

    public static void main(String[] args) {
        Frm.FrmSignIn frmDN= new   Frm.FrmSignIn();
        frmDN.show();
    }
}

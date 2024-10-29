/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.nguoidung;

import java.util.*;

/**
 *
 * @author Cuprum
 */
public class Thethanhvien232 {

    private int id;
    private String quyenloi;
    private Date thoigianlamthe;

    public Thethanhvien232(int id, String quyenloi, Date thoigianlamthe) {
        this.id = id;
        this.quyenloi = quyenloi;
        this.thoigianlamthe = thoigianlamthe;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setQuyenloi(String quyenloi) {
        this.quyenloi = quyenloi;
    }

    public void setThoigianlamthe(Date thoigianlamthe) {
        this.thoigianlamthe = thoigianlamthe;
    }

    public int getId() {
        return id;
    }

    public String getQuyenloi() {
        return quyenloi;
    }

    public Date getThoigianlamthe() {
        return thoigianlamthe;
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.hoadon;

import java.util.*;
import model.banan.Bandat232;
import model.monan.BandatCombo232;
import model.monan.BandatMonan232;
import model.nguoidung.Nhanvienbanhang232;

/**
 *
 * @author Cuprum
 */
public class Hoadon232 {

    private int id;
    private float tongtien;
    private Date thoigiantao;
    private Nhanvienbanhang232 nvbhtaohoadon;
    private Bandat232 bandat;

    public Hoadon232(int id, Date thoigiantao, Nhanvienbanhang232 nvbhtaodon, Bandat232 bandat) {
        this.id = id;
        this.tongtien = 0;
        this.thoigiantao = thoigiantao;
        this.nvbhtaohoadon = nvbhtaodon;
        this.bandat = bandat;
        for (BandatCombo232 item : bandat.getBandatCombo232arr()) {
            this.tongtien += item.getTongtien();
        }
        for (BandatMonan232 item : bandat.getBandatMonan232arr()) {
            this.tongtien += item.getTongtien();
        }
    }

    public int getId() {
        return id;
    }

    public float getTongtien() {
        return tongtien;
    }

    public Date getThoigiantao() {
        return thoigiantao;
    }

    public Nhanvienbanhang232 getNvbhtaohoadon() {
        return nvbhtaohoadon;
    }

    public Bandat232 getBandat() {
        return bandat;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }

    public void setThoigiantao(Date thoigiantao) {
        this.thoigiantao = thoigiantao;
    }

    public void setNvbhtaohoadon(Nhanvienbanhang232 nvbhtaodon) {
        this.nvbhtaohoadon = nvbhtaodon;
    }

    public void setBandat(Bandat232 bandat) {
        this.bandat = bandat;
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.hoadon;

import java.util.*;
import model.banan.Bandat232;
import model.nguoidung.Khachhang232;
import model.nguoidung.Nhanvienbanhang232;

/**
 *
 * @author Cuprum
 */
public class Hoadon232 {

    private int id;
    private float tongtien;
    private Date thoigiantao;
    private Nhanvienbanhang232 nvbhtaodon;
    private Khachhang232 khachhangthanhtoan;
    private Bandat232 bandat;

    public Hoadon232(int id, float tongtien, Date thoigiantao, Nhanvienbanhang232 nvbhtaodon, Khachhang232 khachhangthanhtoan, Bandat232 bandat) {
        this.id = id;
        this.tongtien = tongtien;
        this.thoigiantao = thoigiantao;
        this.nvbhtaodon = nvbhtaodon;
        this.khachhangthanhtoan = khachhangthanhtoan;
        this.bandat = bandat;
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

    public Nhanvienbanhang232 getNvbhtaodon() {
        return nvbhtaodon;
    }

    public Khachhang232 getKhachhangthanhtoan() {
        return khachhangthanhtoan;
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

    public void setNvbhtaodon(Nhanvienbanhang232 nvbhtaodon) {
        this.nvbhtaodon = nvbhtaodon;
    }

    public void setKhachhangthanhtoan(Khachhang232 khachhangthanhtoan) {
        this.khachhangthanhtoan = khachhangthanhtoan;
    }

    public void setBandat(Bandat232 bandat) {
        this.bandat = bandat;
    }

}

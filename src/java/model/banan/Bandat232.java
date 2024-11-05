/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.banan;

import java.util.*;
import model.monan.BandatCombo232;
import model.monan.BandatMonan232;
import model.nguoidung.Khachhang232;
import model.nguoidung.Nhanvienbanhang232;

/**
 *
 * @author Cuprum
 */
public class Bandat232 {

    private int id;
    private Date thoigiandat;
    private String thoigianan;
    private Date ngayan;
    private boolean confirmdat;
    private String mota;
    private Khachhang232 khachhang232;
    private Nhanvienbanhang232 nhanvienbanhang232; // nhân viên bán hàng tạo hoặc xác nhận bàn đặt
    private Banan232 banan232;
    private List<BandatCombo232> bandatCombo232arr;
    private List<BandatMonan232> bandatMonan232arr;

    public Bandat232(int id, Date thoigiandat, String thoigianan, Date ngayan, boolean confirmdat, String mota, Khachhang232 khachhang232, Nhanvienbanhang232 nhanvienbanhang232, Banan232 banan232, List<BandatCombo232> bandatCombo232arr, List<BandatMonan232> bandatMonan232arr) {
        this.id = id;
        this.thoigiandat = thoigiandat;
        this.thoigianan = thoigianan;
        this.ngayan = ngayan;
        this.confirmdat = confirmdat;
        this.mota = mota;
        this.khachhang232 = khachhang232;
        this.nhanvienbanhang232 = nhanvienbanhang232;
        this.banan232 = banan232;
        this.bandatCombo232arr = bandatCombo232arr;
        this.bandatMonan232arr = bandatMonan232arr;
    }

    public List<BandatCombo232> getBandatCombo232arr() {
        return bandatCombo232arr;
    }

    public List<BandatMonan232> getBandatMonan232arr() {
        return bandatMonan232arr;
    }

    public Date getNgayan() {
        return ngayan;
    }

    public String getThoigianan() {
        return thoigianan;
    }

    public int getId() {
        return id;
    }

    public Date getThoigiandat() {
        return thoigiandat;
    }

    public boolean isConfirmdat() {
        return confirmdat;
    }

    public String getMota() {
        return mota;
    }

    public Khachhang232 getKhachhang232() {
        return khachhang232;
    }

    public Nhanvienbanhang232 getNhanvienbanhang232() {
        return nhanvienbanhang232;
    }

    public Banan232 getBanan232() {
        return banan232;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setThoigiandat(Date thoigiandat) {
        this.thoigiandat = thoigiandat;
    }

    public void setConfirmdat(boolean confirmdat) {
        this.confirmdat = confirmdat;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public void setKhachhang232(Khachhang232 khachhang232) {
        this.khachhang232 = khachhang232;
    }

    public void setNhanvienbanhang232(Nhanvienbanhang232 nhanvienbanhang232) {
        this.nhanvienbanhang232 = nhanvienbanhang232;
    }

    public void setBanan232(Banan232 banan232) {
        this.banan232 = banan232;
    }

    public void setThoigianan(String thoigianan) {
        this.thoigianan = thoigianan;
    }

    public void setNgayan(Date ngayan) {
        this.ngayan = ngayan;
    }

}

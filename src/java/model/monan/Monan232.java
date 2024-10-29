/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.monan;

import java.io.Serializable;

/**
 *
 * @author Cuprum
 */
public class Monan232 implements Serializable {

    private int id;
    private String ten;
    private String mota;
    private float dongia;

    public Monan232(int id, String ten, String mota, float dongia) {
        this.id = id;
        this.ten = ten;
        this.mota = mota;
        this.dongia = dongia;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public void setDongia(float dongia) {
        this.dongia = dongia;
    }

    public int getId() {
        return id;
    }

    public String getTen() {
        return ten;
    }

    public String getMota() {
        return mota;
    }

    public float getDongia() {
        return dongia;
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.monan;

/**
 *
 * @author Cuprum
 */
public class Combo232 {

    private int id;
    private String ten;
    private String mota;
    private float dongia;

    public Combo232(int id, String ten, String mota, float dongia) {
        this.id = id;
        this.ten = ten;
        this.mota = mota;
        this.dongia = dongia;
    }

    public float getDongia() {
        return dongia;
    }

    public int getId() {
        return id;
    }

    public String getMota() {
        return mota;
    }

    public String getTen() {
        return ten;
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

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.monan;

/**
 *
 * @author Cuprum
 */
public class BandatMonan232 {

    private int id;
    private int soluong;
    private float dongia;
    private float tongtien;
    private Monan232 monan232;

    public BandatMonan232(int id, int soluong, float dongia, Monan232 monan232) {
        this.id = id;
        this.soluong = soluong;
        this.dongia = dongia;
        this.monan232 = monan232;
        this.tongtien = this.soluong * this.dongia;
    }

    public float getTongtien() {
        return tongtien;
    }

    public int getId() {
        return id;
    }

    public int getSoluong() {
        return soluong;
    }

    public float getDongia() {
        return dongia;
    }

    public Monan232 getMonan232() {
        return monan232;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public void setDongia(float dongia) {
        this.dongia = dongia;
    }

    public void setMonan232(Monan232 monan232) {
        this.monan232 = monan232;
    }

}

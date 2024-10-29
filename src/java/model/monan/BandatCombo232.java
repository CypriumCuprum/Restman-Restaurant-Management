/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.monan;

/**
 *
 * @author Cuprum
 */
public class BandatCombo232 {

    private int id;
    private int soluong;
    private float dongia;
    private Combo232 combo232;

    public BandatCombo232(int id, int soluong, float dongia, Combo232 combo232) {
        this.id = id;
        this.soluong = soluong;
        this.dongia = dongia;
        this.combo232 = combo232;
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

    public Combo232 getCombo232() {
        return combo232;
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

    public void setCombo232(Combo232 combo232) {
        this.combo232 = combo232;
    }

}

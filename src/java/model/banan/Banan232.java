/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.banan;

/**
 *
 * @author Cuprum
 */
public class Banan232 {

    private int id;
    private String tenban;
    private int soban;
    private String mota;

    public Banan232(int id, String tenban, int soban, String mota) {
        this.id = id;
        this.tenban = tenban;
        this.soban = soban;
        this.mota = mota;
    }

    public String getTenban() {
        return tenban;
    }

    public int getId() {
        return id;
    }

    public String getMota() {
        return mota;
    }

    public int getSoban() {
        return soban;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public void setSoban(int soban) {
        this.soban = soban;
    }

    public void setTenban(String tenban) {
        this.tenban = tenban;
    }

}

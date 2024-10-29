/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.nguoidung;

/**
 *
 * @author Cuprum
 */
public class Nguoidung232 {

    private int id;
    private String username;
    private String password;
    private String hovaten;
    private String diachi;
    private String sdt;
    private String ghichu;
    private String vaitro;

    public Nguoidung232(int id, String username, String password, String hovaten, String diachi, String sdt, String ghichu, String vaitro) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.hovaten = hovaten;
        this.diachi = diachi;
        this.sdt = sdt;
        this.ghichu = ghichu;
        this.vaitro = vaitro;
    }

    public void setVaitro(String vaitro) {
        this.vaitro = vaitro;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setHovaten(String hovaten) {
        this.hovaten = hovaten;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getHovaten() {
        return hovaten;
    }

    public String getDiachi() {
        return diachi;
    }

    public String getSdt() {
        return sdt;
    }

    public String getGhichu() {
        return ghichu;
    }

    public String getVaitro() {
        return vaitro;
    }

}

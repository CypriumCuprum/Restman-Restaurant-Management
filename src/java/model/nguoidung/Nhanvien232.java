/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.nguoidung;

/**
 *
 * @author Cuprum
 */
public class Nhanvien232 extends Nguoidung232 {

    private String vitri;

    public Nhanvien232(String vitri, int id, String username, String password, String hovaten, String diachi, String sdt, String ghichu, String vaitro) {
        super(id, username, password, hovaten, diachi, sdt, ghichu, vaitro);
        this.vitri = vitri;
    }

    public String getVitri() {
        return vitri;
    }

    public void setVitri(String vitri) {
        this.vitri = vitri;
    }

}

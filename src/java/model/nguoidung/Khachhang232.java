/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.nguoidung;

/**
 *
 * @author Cuprum
 */
public class Khachhang232 extends Nguoidung232 {

    private Thethanhvien232 thethanhvien232;

    public Khachhang232(Thethanhvien232 thethanhvien232, int id, String username, String password, String hovaten, String diachi, String sdt, String ghichu, String vaitro) {
        super(id, username, password, hovaten, diachi, sdt, ghichu, vaitro);
        this.thethanhvien232 = thethanhvien232;
    }

    public Thethanhvien232 getThethanhvien232() {
        return thethanhvien232;
    }

    public void setThethanhvien232(Thethanhvien232 thethanhvien232) {
        this.thethanhvien232 = thethanhvien232;
    }

}

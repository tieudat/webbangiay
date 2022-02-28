/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class bill {
    public int idBill;
    public Date ngay;
    public String trangThai;
    public String diaChiNhan;
    public String sdtNhan;

    public bill() {
    }

    public bill(Date ngay, String trangThai, String diaChiNhan, String sdtNhan) {
        this.ngay = ngay;
        this.trangThai = trangThai;
        this.diaChiNhan = diaChiNhan;
        this.sdtNhan = sdtNhan;
    }

    public Date getNgay() {
        return ngay;
    }

    public void setNgay(Date ngay) {
        this.ngay = ngay;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getDiaChiNhan() {
        return diaChiNhan;
    }

    public void setDiaChiNhan(String diaChiNhan) {
        this.diaChiNhan = diaChiNhan;
    }

    public String getSdtNhan() {
        return sdtNhan;
    }

    public void setSdtNhan(String sdtNhan) {
        this.sdtNhan = sdtNhan;
    }
    
}

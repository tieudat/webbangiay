/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author admin
 */
public class detailBill {
    public int idDetailBill;
    public shoes s ;
    public bill b;
    public int soLuong;

    public detailBill() {
    }

    public detailBill(int idDetailBill, shoes s, bill b, int soLuong) {
        this.idDetailBill = idDetailBill;
        this.s = s;
        this.b = b;
        this.soLuong = soLuong;
    }

    public int getIdDetailBill() {
        return idDetailBill;
    }

    public void setIdDetailBill(int idDetailBill) {
        this.idDetailBill = idDetailBill;
    }

    public shoes getS() {
        return s;
    }

    public void setS(shoes s) {
        this.s = s;
    }

    public bill getB() {
        return b;
    }

    public void setB(bill b) {
        this.b = b;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    
}

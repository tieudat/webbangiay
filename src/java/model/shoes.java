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
public class shoes {
    public int idShoes;
    public String nameShoes;
    public int giaTien;
    public String loai;
    public String linkImg;
    public String thuongHieu;

    public shoes() {
    }

    public shoes(int idShoes, String nameShoes, int giaTien, String loai, String linkImg, String thuongHieu) {
        this.idShoes = idShoes;
        this.nameShoes = nameShoes;
        this.giaTien = giaTien;
        this.loai = loai;
        this.linkImg = linkImg;
        this.thuongHieu = thuongHieu;
    }

    public int getIdShoes() {
        return idShoes;
    }

    public void setIdShoes(int idShoes) {
        this.idShoes = idShoes;
    }

    public String getNameShoes() {
        return nameShoes;
    }

    public void setNameShoes(String nameShoes) {
        this.nameShoes = nameShoes;
    }

    public int getGiaTien() {
        return giaTien;
    }

    public void setGiaTien(int giaTien) {
        this.giaTien = giaTien;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public String getLinkImg() {
        return linkImg;
    }

    public void setLinkImg(String linkImg) {
        this.linkImg = linkImg;
    }

    public String getThuongHieu() {
        return thuongHieu;
    }

    public void setThuongHieu(String thuongHieu) {
        this.thuongHieu = thuongHieu;
    }
    
    
}

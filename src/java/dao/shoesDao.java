/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import static dao.dao.con;
import com.mysql.jdbc.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.shoes;
import java.util.ArrayList;
/**
 *
 * @author admin
 */
public class shoesDao extends dao {
    public shoesDao(){
        super();
    }
    public ArrayList<shoes> getListShoes(){
        ArrayList<shoes> listShoes= new ArrayList<shoes>();
       
        String sql = "SELECT * from shoes";
            try{
                
                PreparedStatement ps =con.prepareStatement(sql);               
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    shoes sh = new shoes();
                    sh.setIdShoes(rs.getInt("id"));
                    sh.setNameShoes(rs.getString("nameShoes"));
                    sh.setGiaTien(rs.getInt("giaTien"));
                    sh.setLoai(rs.getString("loai"));
                    sh.setLinkImg(rs.getString("linkImg"));
                    sh.setThuongHieu(rs.getString("thuongHieu"));
                    listShoes.add(sh);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return listShoes;
    }
    public ArrayList<shoes> getListNewShoes(){
        ArrayList<shoes> listShoes= new ArrayList<shoes>();
       
        String sql = "SELECT * from shoes ORDER BY id DESC LIMIT 6";
            try{
                
                PreparedStatement ps =con.prepareStatement(sql);               
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    shoes sh = new shoes();
                    sh.setIdShoes(rs.getInt("id"));
                    sh.setNameShoes(rs.getString("nameShoes"));
                    sh.setGiaTien(rs.getInt("giaTien"));
                    sh.setLoai(rs.getString("loai"));
                    sh.setLinkImg(rs.getString("linkImg"));
                    sh.setThuongHieu(rs.getString("thuongHieu"));
                    listShoes.add(sh);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return listShoes;
    }
    public ArrayList<shoes> sortaz(){
        ArrayList<shoes> listShoes= new ArrayList<shoes>();
        String sql = "SELECT * from shoes ORDER BY nameShoes ASC";
            try{
                
                PreparedStatement ps =con.prepareStatement(sql);               
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    shoes sh = new shoes();
                    sh.setIdShoes(rs.getInt("id"));
                    sh.setNameShoes(rs.getString("nameShoes"));
                    sh.setGiaTien(rs.getInt("giaTien"));
                    sh.setLoai(rs.getString("loai"));
                    sh.setLinkImg(rs.getString("linkImg"));
                    sh.setThuongHieu(rs.getString("thuongHieu"));
                    listShoes.add(sh);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return listShoes;
    }
    public ArrayList<shoes> sortGiaTangDan(){
        ArrayList<shoes> listShoes= new ArrayList<shoes>();
        String sql = "SELECT * from shoes ORDER BY giaTien ASC";
            try{
                
                PreparedStatement ps =con.prepareStatement(sql);               
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    shoes sh = new shoes();
                    sh.setIdShoes(rs.getInt("id"));
                    sh.setNameShoes(rs.getString("nameShoes"));
                    sh.setGiaTien(rs.getInt("giaTien"));
                    sh.setLoai(rs.getString("loai"));
                    sh.setLinkImg(rs.getString("linkImg"));
                    sh.setThuongHieu(rs.getString("thuongHieu"));
                    listShoes.add(sh);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return listShoes;
    }
    public ArrayList<shoes> sortGiaGiamDan(){
        ArrayList<shoes> listShoes= new ArrayList<shoes>();
        String sql = "SELECT * from shoes ORDER BY giaTien DESC";
            try{
                
                PreparedStatement ps =con.prepareStatement(sql);               
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    shoes sh = new shoes();
                    sh.setIdShoes(rs.getInt("id"));
                    sh.setNameShoes(rs.getString("nameShoes"));
                    sh.setGiaTien(rs.getInt("giaTien"));
                    sh.setLoai(rs.getString("loai"));
                    sh.setLinkImg(rs.getString("linkImg"));
                    sh.setThuongHieu(rs.getString("thuongHieu"));
                    listShoes.add(sh);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return listShoes;
    }
    public void addShoes(shoes s){
       String sql ="INSERT INTO shoes(nameShoes,giaTien,loai,linkImg,thuongHieu) VALUES(?, ?, ?, ?, ?)";
       try{
                
                PreparedStatement ps =con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);               
                ps.setString(1, s.getNameShoes());
                ps.setInt(2, s.getGiaTien());
                ps.setString(3, s.getLoai());
                ps.setString(4, s.getLinkImg());
                ps.setString(5, s.getThuongHieu());
                ps.executeUpdate();
                ResultSet rs=ps.getGeneratedKeys();
                if(rs.next()){
                    s.setIdShoes(rs.getInt(1));
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        
    }
    public void deleteShoes(int id){
        String sql="DELETE FROM shoes where id=?";
        try{
            PreparedStatement ps =con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            
        }
        catch(Exception e){
            System.out.println("Da xoa");
        }
    }
    public ArrayList<shoes> searchShoes(String name){
        ArrayList<shoes> listItem =new ArrayList<shoes>();
        String sql= "SELECT * FROM shoes WHERE nameShoes Like ? ";
        
        try{
            PreparedStatement ps =con.prepareStatement(sql);
            ps.setString(1,name);
            ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    shoes sh = new shoes();
                    sh.setIdShoes(rs.getInt("id"));
                    sh.setNameShoes(rs.getString("nameShoes"));
                    sh.setGiaTien(rs.getInt("giaTien"));
                    sh.setLoai(rs.getString("loai"));
                    sh.setLinkImg(rs.getString("linkImg"));
                    sh.setThuongHieu(rs.getString("thuongHieu"));
                    listItem.add(sh);
                }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return listItem;
    }
    public ArrayList<shoes> getListTypeShoes(String loai){
        ArrayList<shoes> listShoes= new ArrayList<shoes>();
        String sql = "SELECT * from shoes WHERE loai= ? ";
            try{               
                PreparedStatement ps =con.prepareStatement(sql); 
                ps.setString(1, loai );
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    shoes sh = new shoes();
                    sh.setIdShoes(rs.getInt("id"));
                    sh.setNameShoes(rs.getString("nameShoes"));
                    sh.setGiaTien(rs.getInt("giaTien"));
                    sh.setLoai(rs.getString("loai"));
                    sh.setLinkImg(rs.getString("linkImg"));
                    sh.setThuongHieu(rs.getString("thuongHieu"));
                    listShoes.add(sh);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return listShoes;
    }
    public ArrayList<shoes> getListBrandShoes(String th){
        ArrayList<shoes> listShoes= new ArrayList<shoes>();
        String sql = "SELECT * from shoes WHERE thuongHieu= ? ";
            try{               
                PreparedStatement ps =con.prepareStatement(sql); 
                ps.setString(1, th );
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    shoes sh = new shoes();
                    sh.setIdShoes(rs.getInt("id"));
                    sh.setNameShoes(rs.getString("nameShoes"));
                    sh.setGiaTien(rs.getInt("giaTien"));
                    sh.setLoai(rs.getString("loai"));
                    sh.setLinkImg(rs.getString("linkImg"));
                    sh.setThuongHieu(rs.getString("thuongHieu"));
                    listShoes.add(sh);
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return listShoes;
    }
    public shoes searchShoesid(int id){
        shoes s =new shoes();
        String sql= "SELECT * FROM shoes WHERE id= ?";
        try{
            PreparedStatement ps =con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    s.setIdShoes(rs.getInt("id"));
                    s.setNameShoes(rs.getString("nameShoes"));
                    s.setGiaTien(rs.getInt("giaTien"));
                    s.setLoai(rs.getString("loai"));
                    s.setLinkImg(rs.getString("linkImg"));
                    s.setThuongHieu(rs.getString("thuongHieu"));
                }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }

        return s;
    }
    public void updateShoes(shoes s){
        String sql = "UPDATE shoes SET nameShoes=?, giaTien=?,loai=?,linkImg=?,thuongHieu=? WHERE id=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, s.getNameShoes());
            ps.setInt(2, s.getGiaTien());
            ps.setString(3, s.getLoai());
            ps.setString(4, s.getLinkImg());
            ps.setString(5, s.getThuongHieu());
            ps.setInt(6, s.getIdShoes());
            ps.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
     }  
    public int numberItem(){
        int count=0;
        String sql ="SELECT COUNT(id) AS SL FROM shoes";
        try{
                PreparedStatement ps =con.prepareStatement(sql);               
                ResultSet rs= ps.executeQuery();
                while(rs.next()){
                count = rs.getInt("SL");
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return count;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import com.mysql.jdbc.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.user;
/**
 *
 * @author admin
 */
public class userDAO extends dao{
    public userDAO(){
        super();
    }
    public boolean checkLogin(user user) {
		boolean result = false;
		String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
                                user.setIdUser(rs.getInt("id"));
				user.setFullname(rs.getString("fullname"));
				user.setPosition(rs.getString("position"));
                                user.setSdt(rs.getString("sdt"));
                                user.setAddress(rs.getString("address"));
                                user.setEmail(rs.getString("email"));
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
    public void addUser(user user) {
        
        String sql = "INSERT INTO user(username,password,fullname,position,sdt,address,email) values(? , ?, ?, ?, ?, ?, ?)";
        try {
			PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
                        ps.setString(3, user.getFullname());
                        ps.setString(4, user.getPosition());
			ps.setString(5, user.getSdt());
                        ps.setString(6, user.getAddress());
                        ps.setString(7, user.getEmail());
                        if(checkUsername(user.getUsername()))
                        {
                            ps.executeUpdate();
                        }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
    }
    public boolean checkUsername(String username){
        boolean result =true;
        String sql = "SELECT username FROM user WHERE username = ? ";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
                            result = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
        return result;
    }
    public ArrayList<user> getListCustomer(){
        ArrayList<user> user = new ArrayList<user>();
        
        String sql = "SELECT * FROM user WHERE position='customer'";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                user u = new user();
                u.setIdUser(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFullname(rs.getString("fullname"));
                u.setPosition(rs.getString("position"));
                u.setAddress(rs.getString("address"));
                u.setSdt(rs.getString("sdt"));
                u.setEmail(rs.getString("email"));
                user.add(u);
                }
            }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public ArrayList<user> getListAdmin(){
        ArrayList<user> user = new ArrayList<user>();
        
        String sql = "SELECT * FROM user WHERE position='admin'";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                user u = new user();
                u.setIdUser(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFullname(rs.getString("fullname"));
                u.setPosition(rs.getString("position"));
                u.setAddress(rs.getString("address"));
                u.setSdt(rs.getString("sdt"));
                u.setEmail(rs.getString("email"));
                user.add(u);
                }
            }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public void deleteUser(int id){
        String sql="DELETE FROM user where id=?";
        try{
            PreparedStatement ps =con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            
        }
        catch(Exception e){
            System.out.println("Da xoa");
        }
    }
    public user searchUser(int id){
        user u = new user();
        String sql ="SELECT * FROM user WHERE id=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs =ps.executeQuery();
            while(rs.next())
            {
            u.setIdUser(rs.getInt("id"));
            u.setFullname(rs.getString("fullname"));
            u.setPosition(rs.getString("position"));
            u.setEmail(rs.getString("email"));
            u.setAddress(rs.getString("address"));
            u.setSdt(rs.getString("sdt"));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return u;
    }
    public void updateUser(user u){
        String sql = "UPDATE user SET fullname=? ,sdt=?, address=?, email=? WHERE id=?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, u.getFullname());
            ps.setString(2, u.getSdt());
            ps.setString(3, u.getAddress());
            ps.setString(4, u.getEmail());
            ps.setInt(5, u.getIdUser());
            ps.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
     } 
    public int numberCustomer(){
        int count=0;
        String sql ="SELECT COUNT(id) AS SoKhachHang FROM user WHERE position='customer';";
        try{
                PreparedStatement ps =con.prepareStatement(sql);               
                ResultSet rs= ps.executeQuery();
                while(rs.next()){
                count = rs.getInt("SoKhachHang");
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        return count;
    }
}

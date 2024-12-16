package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.entity.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
    private static final Logger logger = Logger.getLogger(UserDao.class.getName());


	public boolean userRegister(User u) throws SQLException {

		boolean f = false;

		String sql = "insert into user_details(full_name,email,password) values(?,?,?)";

		PreparedStatement pst = con.prepareStatement(sql);

		pst.setString(1, u.getFullName());
		pst.setString(2, u.getEmail());
		pst.setString(3, u.getPassword());

		int i = pst.executeUpdate();

		if (i == 1) {
			f = true;
		}

		return f;

	}

	public User login(String em, String psw) {

		User u = null;

		try {

			String sql = "select * from user_details where email=? and password=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				u = new User();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}

			return u;

		} catch (Exception e) {
			// TODO: handle exception
		}

		return u;

	}

	public int userCount() {

		int count = 0;

		try {

			String sql = "select * from user_details";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				count++;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;

	}

	public boolean checkOldPassword(int userId, String oldPassword) {

		boolean f = false;

		try {

			String sql = "select * from user_details where id=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				f = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}
	  public boolean changeNewPasssword(int userId, String newPassword) {
	        boolean f = false;
	        
	        try {
	            String sql = "update user_details set password=? where id=?";
	            PreparedStatement ps = con.prepareStatement(sql);
	         

	            ps.setString(1, newPassword);

	            ps.setInt(2, userId);
	            
	            int i = ps.executeUpdate();
	            
	            
	 /**          INFO log: Indicates normal operations, such as successful updates.
	            WARNING log: Indicates that something didn't go as expected, such as a failed update.
	            SEVERE log: Indicates that something went wrong, like an exception being thrown.
	            By using these logs, you'll be able to track whether the update was successful and catch any errors that occur during execution.
	  **/
	            
	            if (i == 1) {
	                f = true;
	                logger.log(Level.INFO, "Password updated successfully for userId: {0}", userId);
	            } else {
	                logger.log(Level.WARNING, "Password update failed for userId: {0}", userId);
	            }
	            
	        } catch (Exception e) {
	            logger.log(Level.SEVERE, "Error during password update for userId: " + userId, e);
	        }
	        
	        return f;
	    }

}

package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.entity.Doctor;

public class DoctorDao {

	private Connection con;

	public DoctorDao(Connection con) {
		super();
		this.con = con;
	}
	
    private static final Logger logger = Logger.getLogger(UserDao.class.getName());


	public boolean registerDoctor(Doctor d) {

		boolean f = false;

		try {
			String sql = "insert into doctor(fullname,dob,qualification,specialist,email,mobno,password) values(?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, d.getFullname());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobno());
			ps.setString(7, d.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;

	}

	public List<Doctor> getAllDoctors() throws SQLException {

		List<Doctor> list = new ArrayList<Doctor>();

		Doctor d = null;
		String sql = "select * from doctor order by id desc";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			d = new Doctor();
			d.setId(rs.getInt(1));
			d.setFullname(rs.getString(2));
			d.setDob(rs.getString(3));
			d.setQualification(rs.getString(4));
			d.setSpecialist(rs.getString(5));
			d.setEmail(rs.getString(6));
			d.setMobno(rs.getString(7));
			d.setPassword(rs.getString(8));

			list.add(d);

		}

		return list;

	}

	public Doctor getDoctorsById(int id) throws SQLException {

		Doctor d = null;
		String sql = "select * from doctor where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			d = new Doctor();
			d.setId(rs.getInt(1));
			d.setFullname(rs.getString(2));
			d.setDob(rs.getString(3));
			d.setQualification(rs.getString(4));
			d.setSpecialist(rs.getString(5));
			d.setEmail(rs.getString(6));
			d.setMobno(rs.getString(7));
			d.setPassword(rs.getString(8));

		}

		return d;

	}

	public boolean updateDoctor(Doctor d) {

		boolean f = false;

		try {
			String sql = "update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mobno=?,password=? where id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, d.getFullname());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobno());
			ps.setString(7, d.getPassword());
			ps.setInt(8, d.getId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;

	}

	public boolean deleteDoctor(int id) {

		boolean f = false;

		try {
			String sql = "delete from doctor where id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, id);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;

	}

	public Doctor doctorLogin(String email, String password) {

		Doctor d = null;

		try {

			String sql = "select * from doctor where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				d = new Doctor();

				d.setId(rs.getInt(1));
				d.setFullname(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobno(rs.getString(7));
				d.setPassword(rs.getString(8));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return d;

	}

	public int doctorCount() {

		int count = 0;

		try {

			String sql = "select * from doctor";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs= ps.executeQuery();
			
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

			String sql = "select * from doctor where id=? and password=?";
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
	            String sql = "update doctor set password=? where id=?";
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

	  
	  public boolean editDoctorProfile(Doctor d) {

			boolean f = false;

			try {
				String sql = "update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mobno=? where id=?";

				PreparedStatement ps = con.prepareStatement(sql);

				ps.setString(1, d.getFullname());
				ps.setString(2, d.getDob());
				ps.setString(3, d.getQualification());
				ps.setString(4, d.getSpecialist());
				ps.setString(5, d.getEmail());
				ps.setString(6, d.getMobno());
				ps.setInt(7, d.getId());

				int i = ps.executeUpdate();

				if (i == 1) {
					f = true;
				}

			} catch (Exception e) {
				// TODO: handle exception
			}
			return f;

		}

}

package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDao {

	private Connection con;

	public AppointmentDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addAppointment(Appointment ap) {

		boolean f = false;

		try {

			String sql = "insert into appointment (user_id,fullname,gender,age,appoindate,email,phno,diseases,doctor_id,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, ap.getUserid());
			ps.setString(2, ap.getFullname());
			ps.setString(3, ap.getGender());
			ps.setString(4, ap.getAge());
			ps.setString(5, ap.getAppoinDate());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getPhNo());
			ps.setString(8, ap.getDiseases());
			ps.setInt(9, ap.getDoctorId());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getStatus());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Appointment> getAppointmentByLoginUser(int userId) {

		Appointment ap = null;
		List<Appointment> list = new ArrayList<Appointment>();

		try {

			String sql = "select * from appointment where user_Id=?";

			PreparedStatement ps = con.prepareStatement(sql);
			 ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				ap = new Appointment();

				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				list.add(ap);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	public List<Appointment> getAppointmentByDoctorLogin(int doctorId) {

		Appointment ap = null;
		List<Appointment> list = new ArrayList<Appointment>();

		try {

			String sql = "select * from appointment where doctor_Id=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,doctorId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				ap = new Appointment();

				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				list.add(ap);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	public Appointment getAppointmentById(int id) {
		
		Appointment ap = null;
		
		try {
			
			String sql = "select * from appointment where id=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				
				ap = new Appointment();
				
				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ap;
		
	}
	
	
	
	public boolean updateCommentStatus(int id,int doctorId , String comment) {
		
		boolean f=false;
		
		try {
			
			String sql="update appointment set status=? where id=? and doctor_id=? ";
			PreparedStatement ps= con.prepareStatement(sql);
			
			ps.setString(1, comment);
			ps.setInt(2, id);
			ps.setInt(3, doctorId);
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
		
		
	}
	
	
	
	
	
	
	public List<Appointment> getAllAppointment() {

		Appointment ap = null;
		List<Appointment> list = new ArrayList<Appointment>();

		try {

			String sql = "select * from appointment order by id desc";

			PreparedStatement ps = con.prepareStatement(sql);
		

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				ap = new Appointment();

				ap.setId(rs.getInt(1));
				ap.setUserid(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				list.add(ap);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	
	public int AppointmentCount() {

		int count = 0;

		try {

			String sql = "select * from appointment";
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
	
	
public int countAppointmentByDoctorId(int did) {
		
		int count = 0;
		
		try {
			
			String sql = "select * from appointment where doctor_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, did);
			
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

}

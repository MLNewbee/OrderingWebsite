package com.eight.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.eight.beans.User;
import com.opensymphony.xwork2.ActionContext;

public class UserDao {
	private User my_user=new User();
	private Connection con;
	private String driver="com.mysql.cj.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/order_db?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT&useSSL=false";
	private String user="root";
	private String password="menglong521";

	public UserDao(){
		super();
	}
	public void ban(int id){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, this.password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String update="update user set isactive='禁用' where id='"+id+"' " ;
			System.out.println("--执行到---banuser-----dao----id"+id);
			statement.executeUpdate(update);
			con.close();
		}catch(ClassNotFoundException e){
			System.out.println("Sorry,can't find the Driver!");
			e.printStackTrace();
		}catch(SQLException e){
			//todo
			e.printStackTrace();
		}catch(Exception e){
			//todo
			e.printStackTrace();
		}finally{
			System.out.println("数据库访问成功！");
		}
	}
	public void insert(String username,String password,String phonenum,String company,String address){
		String active="激活";
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, this.password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String insert="insert into user values(NULL,'"+username+"','"+password+"','"+phonenum+"','"+company+"','"+address+"','"+active+"')";
			statement.execute(insert);
			con.close();
		}catch(ClassNotFoundException e){
			System.out.println("Sorry,can't find the Driver!");
			e.printStackTrace();
		}catch(SQLException e){
			//todo
			e.printStackTrace();
		}catch(Exception e){
			//todo
			e.printStackTrace();
		}finally{
			System.out.println("数据库访问成功！");
		}
	}
	
	public void delete(int id){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String delete="delete from user where id='"+id+"' ";
			statement.execute(delete);
			con.close();
		}catch(ClassNotFoundException e){
			System.out.println("Sorry,can't find the Driver!");
			e.printStackTrace();
		}catch(SQLException e){
			//todo
			e.printStackTrace();
		}catch(Exception e){
			//todo
			e.printStackTrace();
		}finally{
			System.out.println("数据库访问成功！");
		}
	}
	
	public void update(int id,String username,String password,String phonenum,String company,String address){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, this.password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String update="update user set username='"+username+"',password='"+password+"',phonenum='"+phonenum+"',"
					+ "company='"+company+"',address='"+address+"' where id='"+id+"' " ;
			statement.execute(update);
			con.close();
		}catch(ClassNotFoundException e){
			System.out.println("Sorry,can't find the Driver!");
			e.printStackTrace();
		}catch(SQLException e){
			//todo
			e.printStackTrace();
		}catch(Exception e){
			//todo
			e.printStackTrace();
		}finally{
			System.out.println("数据库访问成功！");
		}
	}
	
	public User select(int id){
		try{
		    Class.forName(driver);
		    con=DriverManager.getConnection(url, user, password);
		    if(!con.isClosed())
		    	System.out.println("Succeeded connecting to the Database!");
		    Statement statement=con.createStatement();
		    String select="select * from user where id='"+id+"' ";
			ResultSet rs=statement.executeQuery(select);
			while(rs.next()){
				this.my_user=new User(id,rs.getString("username"),rs.getString("password"),rs.getString("phonenum"),
						rs.getString("company"),rs.getString("address"),rs.getString("isactive"));
			}
			rs.close();
			con.close();
		}catch(ClassNotFoundException e){
			System.out.println("Sorry,can't find the Driver!");
			e.printStackTrace();
		}catch(SQLException e){
			//todo
			e.printStackTrace();
		}catch(Exception e){
			//todo
			e.printStackTrace();
		}finally{
			System.out.println("数据库访问成功！");
		}
		return this.my_user;
	}
	
	public User selectByName(String user_name){
		try{
		    Class.forName(driver);
		    con=DriverManager.getConnection(url, user, password);
		    if(!con.isClosed())
		    	System.out.println("Succeeded connecting to the Database!");
		    Statement statement=con.createStatement();
		    String select="select * from user where username='"+user_name+"' ";
			ResultSet rs=statement.executeQuery(select);
			
			while(rs.next()){
				this.my_user.setId(rs.getInt("id"));
				this.my_user.setUsername(rs.getString("username"));
				this.my_user.setPassword(rs.getString("password"));
				this.my_user.setPhonenum(rs.getString("phonenum"));
				this.my_user.setCompany(rs.getString("company"));
				this.my_user.setAddress(rs.getString("address"));
				this.my_user.setIsactive(rs.getString("isactive"));
			}
			rs.close();
			con.close();
		}catch(ClassNotFoundException e){
			System.out.println("Sorry,can't find the Driver!");
			e.printStackTrace();
		}catch(SQLException e){
			//todo
			e.printStackTrace();
		}catch(Exception e){
			//todo
			e.printStackTrace();
		}finally{
			System.out.println("数据库访问成功！");
		}
		return this.my_user;
	}
	public ArrayList<User> getAllUsers(){
		ArrayList<User>  all_users  = new ArrayList<User>();
		
		int[] id = new int[1000];
		int i=0;
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String selectOrders="select id from user";
			ResultSet rs1=statement.executeQuery(selectOrders);
			 while(rs1.next()){	
			    	id[i]= rs1.getInt("id");
			    	System.out.print(id[i]+"\n");
			    	all_users.add(select(id[i]));
					i++;
				}
			    
			    ActionContext.getContext().getSession().put("all_users",all_users);
				rs1.close();
				con.close();
		}catch(ClassNotFoundException e){
			System.out.println("Sorry,can't find the Driver!");
			e.printStackTrace();
		}catch(SQLException e){
			//todo
			e.printStackTrace();
		}catch(Exception e){
			//todo
			e.printStackTrace();
		}finally{
			System.out.println("数据库访问成功！");
		}
		return all_users;
		
	}
}

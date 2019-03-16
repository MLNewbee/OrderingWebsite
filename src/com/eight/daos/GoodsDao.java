package com.eight.daos;

import com.eight.beans.Goods;
import com.eight.beans.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class GoodsDao {
	private Goods goods;
	private Connection con;
	private String driver="com.mysql.cj.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/order_db?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT&useSSL=false";
	private String user="root";
	private String password="menglong521";
	private UserDao userDao=new UserDao();
	
	public GoodsDao() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void updateNumber(int id,int number){
		try{
		    Class.forName(driver);
		    con=DriverManager.getConnection(url, user, password);
		    if(!con.isClosed())
		    	System.out.println("Succeeded connecting to the Database!");
		    Statement statement=con.createStatement();
		    String update="update goods set number='"+number+"' where id='"+id+"' ";
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
	public void addImg(String path,int id){
		try{
		    Class.forName(driver);
		    con=DriverManager.getConnection(url, user, password);
		    if(!con.isClosed())
		    	System.out.println("Succeeded connecting to the Database!");
		    Statement statement=con.createStatement();
		    String update="update goods set img='"+path+"' where id='"+id+"' ";
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
	public User getSupplier(int supplier){
		return this.userDao.select(supplier);
	}
	public  void insect(String kinds,String name,int price,int number,int supplier){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String insert="insert into goods values('"+kinds+"','"+name+"','"+price+"','"+number+"',NULL,'"+supplier+"',NULL)";
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
		    String check="delete from goods where id='"+id+"' ";
			statement.execute(check);
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
	public void update(int id,String kinds,String name,int price){
		try{
		    Class.forName(driver);
		    con=DriverManager.getConnection(url, user, password);
		    if(!con.isClosed())
		    	System.out.println("Succeeded connecting to the Database!");
		    Statement statement=con.createStatement();
		    String update="update goods set kinds='"+kinds+"',name='"+name+"',price='"+price+"' where id='"+id+"' ";
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
	public Goods select(int id){
		try{
		    Class.forName(driver);
		    con=DriverManager.getConnection(url, user, password);
		    if(!con.isClosed())
		    	System.out.println("Succeeded connecting to the Database!");
		    Statement statement=con.createStatement();
		    String select="select * from goods where id='"+id+"' ";
			ResultSet rs=statement.executeQuery(select);
			
			while(rs.next()){
				this.goods=new Goods(rs.getString("kinds"),rs.getString("name"),rs.getInt("price"),rs.getInt("number"),id,rs.getInt("supplier"),rs.getString("img"));
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
		return this.goods;
	}
	@SuppressWarnings("null")
	public  ArrayList<Goods> getAllGoods(){
		ArrayList<Goods> all_my_goods=new ArrayList<Goods>();
		int[] id = new int[1000];
		int i=0;
		try{
		    Class.forName(driver);
		    con=DriverManager.getConnection(url, user, password);
		    if(!con.isClosed())
		    	System.out.println("Succeeded connecting to the Database!");
		    Statement statement=con.createStatement();
		    String select1="select id from goods ";
		    ResultSet rs1=statement.executeQuery(select1);
		    while(rs1.next()){	
		    	id[i]= rs1.getInt("id");
		    	i++;
		    }
			rs1.close();
			con.close();
			for(int j=0;j<999;j++){
				if(id[j]!=0){
					all_my_goods.add(select(id[j]));
				}
			}
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
			System.out.println("数据库访问成功！"+"\n");
		}
		return all_my_goods;
	}
	@SuppressWarnings("null")
	public  int[] getAllGoodsId(){
		ArrayList<Goods> all_my_goods=new ArrayList<Goods>();
		int[] id = new int[1000];
		int i=0;
		try{
		    Class.forName(driver);
		    con=DriverManager.getConnection(url, user, password);
		    if(!con.isClosed())
		    	System.out.println("Succeeded connecting to the Database!");
		    Statement statement=con.createStatement();
		    String select1="select id from goods ";
		    ResultSet rs1=statement.executeQuery(select1);
		    while(rs1.next()){	
		    	id[i]= rs1.getInt("id");
		    	i++;
		    }
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
			System.out.println("数据库访问成功！"+"\n");
		}
		return id;
	}
}



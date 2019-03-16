package com.eight.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.eight.beans.Goods;
import com.eight.beans.Order;
import com.eight.beans.User;
import com.opensymphony.xwork2.ActionContext;

public class OrderDao {
	private Connection con;
	private String driver="com.mysql.cj.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/order_db?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT&useSSL=false";
	private String user="root";
	private String password="menglong521";
	
	private Order aOrder;
	
	private GoodsDao goodsDao= new GoodsDao();
	private UserDao userDao = new UserDao();
	
	public OrderDao(){}
	
	public Goods getGoodsById(int goods_id){
		return this.goodsDao.select(goods_id);
	}
	public void receive(int id){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String insert="update myorder set status='已接收' where id='"+id+"'";
			statement.execute(insert);
			con.close();
			ArrayList<Order> all_my_orders = new ArrayList<Order>();
			ArrayList<Goods> orders_goods = new ArrayList<Goods>();
			ArrayList<User>  orders_user  = new ArrayList<User>();
			all_my_orders = this.getAllOrders();
			ActionContext.getContext().getSession().put("all_orders",all_my_orders);
			
			 int size = all_my_orders.size();
			    for(int i1=0;i1<size;i1++)
			    {
			    	 orders_goods.add(goodsDao.select(all_my_orders.get(i1).getGoods()));
			    	 orders_user.add(userDao.select(all_my_orders.get(i1).getConsumer()));
			    }
			
			    ActionContext.getContext().getSession().put("all_orders",all_my_orders);
			    ActionContext.getContext().getSession().put("orders_goods",orders_goods);
			    ActionContext.getContext().getSession().put("orders_user",orders_user);
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
	
	public void send(int id){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String insert="update myorder set status='已发送' where id='"+id+"'";
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
	public  void insect(int amount,int supplier,int goodsId){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			
			Date start_time = new java.sql.Date(new java.util.Date().getTime());
			String status = "未发货";
			
			//int goods = (int) ActionContext.getContext().getSession().get("second_id");
			int price = goodsDao.select(goodsId).getPrice();
			int sum = amount*price;
			int consumer = (int) ActionContext.getContext().getSession().get("user_id");
			//int supplier = goodsDao.select(goods).getSupplier();
			System.out.println("执行到这里------cunsume----dao--------");
			String insert="insert into myorder values(null,'"+start_time+"',null,'"+status+"',"
					+ "'"+amount+"','"+sum+"','"+supplier+"','"+consumer+"',null,'"+goodsId+"')";
			statement.executeUpdate(insert);
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
	public  void insect(int amount,int price){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			Date start_time = new java.sql.Date(new java.util.Date().getTime());
			String status = "未发货";
			int sum = amount*price;
			String insert="insert into myorder values(null,'"+start_time+"',null,'"+status+"',";
					//+ " '"+amount+"','"+sum+"','"+supplier+"','"+consumer+"',null,'"+goods+"')";
			statement.executeUpdate(insert);
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
	
	public  void delete(int id){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String insert="delete from myorder where id='"+id+"' ";
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
	
	public  void update1(int id){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String insert="update myorder set status='已发货' where id='"+id+"'";
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
	
	public  void update2(int id){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String insert="update myorder set status='已收货' where id='"+id+"'";
			statement.executeUpdate(insert);
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
	
	//todo
	  
	public Order select(int id){
		try{
		    Class.forName(driver);
		    con=DriverManager.getConnection(url, user, password);
		    if(!con.isClosed())
		    	System.out.println("Succeeded connecting to the Database!");
		    Statement statement=con.createStatement();
		    String select="select * from myorder where id='"+id+"' ";
			ResultSet rs=statement.executeQuery(select);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			while(rs.next()){
				this.aOrder=  new Order(rs.getInt("id"),
						rs.getDate("start_time"),
						//formatter.format(rs.getDate("end_time")
						null,
										rs.getString("status"),
										rs.getInt("amount"),
										rs.getInt("sum"),
										rs.getInt("supplier"),
										rs.getInt("consumer"),
										rs.getInt("comment"),
										rs.getInt("goods"));
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
		return this.aOrder;
	}
	public  ArrayList<Order> getAllOrders(){
		ArrayList<Order> all_my_orders = new ArrayList<Order>();
		ArrayList<Goods> orders_goods = new ArrayList<Goods>();
		ArrayList<User>  orders_user  = new ArrayList<User>();
		int[] id = new int[1000];
		int i=0;
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url, user, password);
			if(!con.isClosed())
				System.out.println("Succeeded connecting to the Database!");
			Statement statement=con.createStatement();
			String selectOrders="select id from myorder";
			ResultSet rs1=statement.executeQuery(selectOrders);
			 while(rs1.next()){	
			    	id[i]= rs1.getInt("id");
			    	System.out.print(id[i]+"\n");
					all_my_orders.add(select(id[i]));
					i++;
				}
			 
			 int size = all_my_orders.size();
			    for(int i1=0;i1<size;i1++)
			    {
			    	orders_goods.add(goodsDao.select(all_my_orders.get(i1).getGoods()));
			    	orders_user.add(userDao.select(all_my_orders.get(i1).getConsumer()));
			    }
			
			    ActionContext.getContext().getSession().put("all_orders",all_my_orders);
			    ActionContext.getContext().getSession().put("orders_goods",orders_goods);
			    ActionContext.getContext().getSession().put("orders_user",orders_user);
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
		return all_my_orders;
	}
}



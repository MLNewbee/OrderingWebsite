package com.eight.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.eight.beans.Comment;

public class CommentDao {
	private Comment aComment=new Comment();
	
	static String url =  "jdbc:mysql://localhost:3306/order_db?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT&useSSL=false";
    static Connection aConnection;
    static Statement aStatement;
    
    static int star;
    static String comment;
	
    public CommentDao(){}
    
    public void insert(Comment aComment)throws Exception{
    	try{
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		aConnection = DriverManager.getConnection(url,"root","menglong521");
    		aStatement = aConnection.createStatement();
    	}
    	catch(ClassNotFoundException e){
    		System.out.println(e);
    	}
    	catch(SQLException e){
    		System.out.println();
    	}
    	star = aComment.getStar();
    	comment = aComment.getComment();
    	
    	String sql = "insert into comment(star,comment,id)"
    			+"values ('"+star+"','"+comment+"',null)";
   
    		try{
    			int result = aStatement.executeUpdate(sql);
    		}
    		catch (SQLException ee)
    		{
    			System.out.println(ee);
    		}
    	
    	try{
    		aStatement.close();
    		aConnection.close();
    	}
    	catch (SQLException e){
    		System.out.println();
    	}
    }
    public void update(Comment comment,int id)throws Exception{
      	try{
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		aConnection = DriverManager.getConnection(url,"root","menglong521");
    		aStatement = aConnection.createStatement();
    	}
    	catch(ClassNotFoundException e){
    		System.out.println(e);
    	}
    	catch(SQLException e){
    		System.out.println();
    	}
      	String sql = "update comment set star ='"+comment.getStar()+"',comment ='"+comment.getComment()+"'where id='"+id+"'";
      	try{
			int result = aStatement.executeUpdate(sql);

		}
		catch (SQLException ee)
		{
			System.out.println(ee);
		}
      	try{
    		aStatement.close();
    		aConnection.close();
    	}
    	catch (SQLException e){
    		System.out.println();
    	}
    }
    public void delete(int id)throws Exception{
      	try{
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		aConnection = DriverManager.getConnection(url,"root","menglong521");
    		aStatement = aConnection.createStatement();
    	}
    	catch(ClassNotFoundException e){
    		System.out.println(e);
    	}
    	catch(SQLException e){
    		System.out.println();
    	}
      	String sql = "delete from comment where id='"+id+"'";
      	try{
			int result = aStatement.executeUpdate(sql);
		}
		catch (SQLException ee)
		{
			System.out.println(ee);
		}
      	try{
    		aStatement.close();
    		aConnection.close();
    	}
    	catch (SQLException e){
    		System.out.println();
    	}
	
    }
    public Comment select(int id)throws Exception{
    	try{
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		aConnection = DriverManager.getConnection(url,"root","menglong521");
    		aStatement = aConnection.createStatement();
    	}
    	catch(ClassNotFoundException e){
    		System.out.println(e);
    	}
    	catch(SQLException e){
    		System.out.println();
    	}
    	
    	String sql = "select * from comment where id='"+id+"'";
        ResultSet rs = aStatement.executeQuery(sql);
    	while(rs.next()){
    		star = rs.getInt("star");
    		comment = rs.getString("comment");
    		System.out.println(star +"   at dao");
    		System.out.println(comment +"    at dao");
    	}
    	aComment.setStar(star);
    	aComment.setComment(comment);
    	try{
    		aStatement.close();
    		aConnection.close();
    	}
    	catch (SQLException e){
    		System.out.println();
    	}
    	
		return aComment;
    }
}

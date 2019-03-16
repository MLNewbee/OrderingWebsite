package com.eight.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.eight.beans.User;
import com.eight.daos.GoodsDao;
import com.eight.daos.OrderDao;
import com.eight.daos.UserDao;
import com.opensymphony.xwork2.ActionSupport;

public class BackManageAction extends ActionSupport {
	private User user = new User();
	private UserDao userDao = new UserDao();
	private GoodsDao goodsDao = new GoodsDao();
	private OrderDao orderDao = new OrderDao();
	
	public String getAllUsers()
	 {
		userDao.getAllUsers();
		 return SUCCESS;
	 }
	public String getAllGoods()
	 {
		 goodsDao.getAllGoods();
		 return SUCCESS;
	 }
	public String getAllOrders()
	 {
		 orderDao.getAllOrders();
		 return SUCCESS;
	 }
	
	 public void deleteGoods()
	 {
		 HttpServletRequest request=ServletActionContext.getRequest();
	    	if(request.getParameter("goodsId")!=null){
	    		String goods_id=request.getParameter("goodsId");
	    		int id=Integer.parseInt(goods_id);
	    		goodsDao.delete(id);
	    	}
	 }
	 public void banUser()
	 {
	  		System.out.println("--执行到---banuser----方法");
		 HttpServletRequest request=ServletActionContext.getRequest();
	    	if(request.getParameter("userId")!=null){
	    		String user_id=request.getParameter("userId");
	    		int id=Integer.parseInt(user_id);
	    		System.out.println("--执行到---banuser-----action----id"+id);
	    		userDao.ban(id);
	    	}
	 }
	
}

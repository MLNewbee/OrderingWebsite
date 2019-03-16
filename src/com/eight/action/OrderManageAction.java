package com.eight.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.eight.beans.*;
import com.eight.daos.GoodsDao;
import com.eight.daos.OrderDao;
import com.eight.daos.UserDao;

public class OrderManageAction extends ActionSupport{
	private Order aOrder=new Order();
	private OrderDao orderDao = new OrderDao();
	private UserDao userDao = new UserDao();
	private GoodsDao goodsDao = new GoodsDao();
	private int number=0;
	
	public String setOrderIds() throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();
		String order_id=request.getParameter("order_id");
		int Order_id=Integer.parseInt(order_id);
		System.out.print("执行到这里了呢----consume--action-----"+Order_id);
		ActionContext.getContext().getSession().put("order_id", Order_id);
		return SUCCESS;
    }

	public String receiveOrder(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String order_id=request.getParameter("orderId");
		int Order_id=Integer.parseInt(order_id);
		orderDao.receive(Order_id);
		ArrayList<Order> all_my_orders = new ArrayList<Order>();
		ArrayList<Goods> orders_goods = new ArrayList<Goods>();
		ArrayList<User>  orders_user  = new ArrayList<User>();
		all_my_orders = orderDao.getAllOrders();
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
		return SUCCESS;
	}
	public String sendOrder(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String order_id=request.getParameter("orderId");
		int Order_id=Integer.parseInt(order_id);
		orderDao.send(Order_id);
		
		ArrayList<Order> all_my_orders = new ArrayList<Order>();
		ArrayList<Goods> orders_goods = new ArrayList<Goods>();
		ArrayList<User>  orders_user  = new ArrayList<User>();
		all_my_orders = orderDao.getAllOrders();
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
		return SUCCESS;
	}
	 public String comsume(){
		int supplier=(int) ActionContext.getContext().getSession().get("supplier");
		int goodsId=(int) ActionContext.getContext().getSession().get("goods_id");
		System.out.print("-------dodjjfdkfjdkfjd------------");
		//int number=goodsDao.select(goodsId).getNumber();
		goodsDao.updateNumber(goodsId, goodsDao.select(goodsId).getNumber()+1);
		ActionContext.getContext().getSession().put("all_goods", this.goodsDao.getAllGoods());
		orderDao.insect(aOrder.getAmount(),supplier,goodsId); 
		return SUCCESS;
	 }
	 public String insert()
	 {
		return SUCCESS;
	 }
	 public String delete()
	 {
		return SUCCESS;
	 }
	 public String update()
	 {
		return SUCCESS;
	 }
	 public String select()
	 {
		return SUCCESS;
	 }
	 public String getAllOrders()
	 {
		 ArrayList<Order> all_my_orders = new ArrayList<Order>();
		 all_my_orders = orderDao.getAllOrders();
		 ActionContext.getContext().getSession().put("all_orders",all_my_orders);
		 return SUCCESS;
	 }
	 public String getUnsolvedOrders()
	 {
		 ArrayList<Order> all_my_orders = new ArrayList<Order>();
		 ArrayList<Order> unsolved_orders = new ArrayList<Order>();
		 all_my_orders = orderDao.getAllOrders();
		 int lenght = all_my_orders.size();
		 for(int i=0;i<lenght;i++){
			 if(all_my_orders.get(i).getStatus().equals("未发货")){
				 unsolved_orders.add(all_my_orders.get(i));
			 }
		 }
		 ActionContext.getContext().getSession().put("unsolved_orders",unsolved_orders);
		 
		 return SUCCESS;
	 }
	 public String getSolvedOrders()
	 {
		 ArrayList<Order> all_my_orders = new ArrayList<Order>();
		 ArrayList<Order> solved_orders = new ArrayList<Order>();
		 all_my_orders = orderDao.getAllOrders();
		 int lenght = all_my_orders.size();
		 for(int i=0;i<lenght;i++){
			 if(all_my_orders.get(i).getStatus().equals("已发送")||all_my_orders.get(i).getStatus().equals("已接收"))
			 {
				 solved_orders.add(all_my_orders.get(i));
			 }
		 }
		 ActionContext.getContext().getSession().put("solved_orders",solved_orders);
		 return SUCCESS;
	 }
	 public String getReturnedOrders()
	 {
		 ArrayList<Order> all_my_orders = new ArrayList<Order>();
		 ArrayList<Order> returned_orders = new ArrayList<Order>();
		 all_my_orders = orderDao.getAllOrders();
		 int lenght = all_my_orders.size();
		 for(int i=0;i<lenght;i++){
			 if(all_my_orders.get(i).getStatus().equals("退货")){
				 returned_orders.add(all_my_orders.get(i));
			 }
		 }
		 ActionContext.getContext().getSession().put("returned_orders",returned_orders);
		 return SUCCESS;
	 }

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
}

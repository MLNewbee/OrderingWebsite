package com.eight.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.eight.beans.User;
import com.eight.daos.GoodsDao;
import com.eight.daos.UserDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private UserDao userdao=new UserDao();
	private	GoodsDao goodsDao=new GoodsDao();
	private String user_name;
	private String shop;
	private String user_password;
	private String confirm_password;
	private String addr;
	private String phone;
	private Map<String, Object> session;
	private int backinfo=3;
	private int isManager=0;
	
	@Override
    public String execute() throws Exception {
		ActionContext context=ActionContext.getContext();
		this.session=context.getSession();
		session.put("all_goods",this.goodsDao.getAllGoods());
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String username=request.getParameter("user_name");
		String password=request.getParameter("password");
		User my_user=this.userdao.selectByName(username);
		if(my_user.getUsername()==null){
			System.out.printf("Please input correct username\n");
			this.backinfo=1;
			return SUCCESS;
		}else{
			if(!my_user.getPassword().equals(password)){
				System.out.printf("Please input correct password\n");
				this.backinfo=2;
				//session.put("user_id",my_user.getId());
				return SUCCESS;
			}else if(!my_user.getIsactive().equals("激活")){
				System.out.printf("没激活\n");
				this.backinfo=3;
				return SUCCESS;
			}else{
				System.out.printf("欢迎\n");
				this.backinfo=4;
				if(my_user.getUsername().equals("蒙龙")){
					this.isManager=1;
				}
				session.put("user_id",my_user.getId());
				return SUCCESS;
			}
		}
    }
	
	public String register() throws Exception{
		System.out.print("-----------------------------");
		HttpServletRequest request=ServletActionContext.getRequest();
		if(request.getParameter("user_name")!=null && request.getParameter("password")!=null &&
				request.getParameter("confirm_password")!=null &&request.getParameter("phone")!=null &&
				request.getParameter("shop")!=null && request.getParameter("addr")!=null){
			String username=request.getParameter("user_name");
			String password=request.getParameter("password");
			String confirmpassword=request.getParameter("confirm_password");
			String phone=request.getParameter("phone");
			String shop=request.getParameter("shop");
			String addr=request.getParameter("addr");
			User my_user=this.userdao.selectByName(username);
			if(my_user.getUsername()==null){
				if(password.equals(confirmpassword)){
					this.userdao.insert(username, password, phone,
							shop,addr);
					this.backinfo=3;
					return SUCCESS;
				}else{
					this.backinfo=2;
					System.out.printf("your twice input of password is not the same\n");
					return SUCCESS;
				}
			}else{
				this.backinfo=1;
				System.out.printf("this name is used\n");
				return SUCCESS;
			}
		}
		return SUCCESS;
	}
	public void delete(){
		
	}
	public void update(){
		
	}
	public String login(){
		ActionContext context=ActionContext.getContext();
		this.session=context.getSession();
		session.put("all_goods",this.goodsDao.getAllGoods());
		if(getUser_name()==null){
			System.out.printf("Please input username\n");
			return "please input username";
		}else{
			if(getUser_password()==null){
				System.out.printf("Please input password\n");
				return "please input password";
			}else{
				User my_user=this.userdao.selectByName(getUser_name());
				if(my_user.getUsername()==null){
					System.out.printf("Please input correct username\n");
					session.put("login_backinfo", 1);
					System.out.print(session.get("login_backinfo"));
					return "no_this_user";
				}else{
					if(my_user.getPassword().equals(getUser_password())){
						System.out.printf("Welcome!\n");
						this.session=context.getSession();
						session.put("user_id",my_user.getId());
						session.put("login_backinfo", 3);
						System.out.print(session.get("login_backinfo"));
						return SUCCESS;
					}else{
						System.out.printf("Please input correct password\n");
						this.session=context.getSession();
						session.put("login_backinfo", 2);
						System.out.print(session.get("login_backinfo"));
						return "wrong_password";
					}
				}
			}
		}
	}
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getShop() {
		return shop;
	}
	public void setShop(String shop) {
		this.shop = shop;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getConfirm_password() {
		return confirm_password;
	}
	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getBackinfo() {
		return backinfo;
	}

	public void setBackinfo(int backinfo) {
		this.backinfo = backinfo;
	}

	public int getIsManager() {
		return isManager;
	}

	public void setIsManager(int isManager) {
		this.isManager = isManager;
	}
}

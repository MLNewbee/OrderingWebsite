package com.eight.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.ServletActionContext;

import com.eight.daos.GoodsDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class GoodsManageAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	//private Map<String,Object> request;
	//private Map<String, Object> session;
	private	GoodsDao goodsDao=new GoodsDao();
	private String kinds="man";
	private String name;
	private int price;
	private int number;
	private int id;
	
	
	public String upload() throws ServletException, IOException {
		System.out.println("----------------rggrrgs---------------");
		HttpServletRequest request=ServletActionContext.getRequest();
		DiskFileItemFactory factory= new DiskFileItemFactory();
		ServletFileUpload  upload = new ServletFileUpload(factory);
		try {
			@SuppressWarnings("unchecked")
			List<FileItem> list = upload.parseRequest(request);
			for (int i= 0 ;i<list.size();i++) {
				FileItem item = list.get(i);
				if (item.isFormField()) {
					String key = item.getFieldName();
					String value = item.getString();
					System.out.println("参数名："+key+"参数值："+value);
				}else {
					System.out.println("-----------------02--------------");
					String key = item.getFieldName();
					String value = item.getName();
					System.out.println(value);
					if (value.contains("\\")) {
						value = value.substring(value.lastIndexOf("\\"));
					}
					 
					System.out.println("参数名："+key+"文件："+value);
					String path = ServletActionContext.getServletContext().getRealPath("saveImage");
					File file = new File(path,value);
					item.write(file);
					if(request.getParameter("goodsId")!=null){
						String goods_id=request.getParameter("goodsId");
			        	int id=Integer.parseInt(goods_id);
			        	System.out.print(id+"--------------------");
						this.goodsDao.addImg("saveImage/"+value, id);
						ActionContext.getContext().getSession().put("all_goods", this.goodsDao.getAllGoods());
						System.out.println(path);
					}
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;

	}

	public String getGoodsId(){
		HttpServletRequest request=ServletActionContext.getRequest();
		if(request.getParameter("goodsId")!=null ){
        	String goods_id=request.getParameter("goodsId");
        	int id=Integer.parseInt(goods_id);
        	System.out.print(id+"--------goodsId------------");
        	ActionContext.getContext().getSession().put("goods_id",id);
		}
		if(request.getParameter("supplier")!=null ){
        	String supplier=request.getParameter("supplier");
        	int id=Integer.parseInt(supplier);
        	System.out.print(id+"--------supplier------------");
        	ActionContext.getContext().getSession().put("supplier",id);
        	}
		return SUCCESS;
	}
	
	public String getSupplier(){
		HttpServletRequest request=ServletActionContext.getRequest();
		if(request.getParameter("supplier")!=null ){
        	String supplier=request.getParameter("supplier");
        	int id=Integer.parseInt(supplier);
        	System.out.print(id+"--------------------");
        	ActionContext.getContext().getSession().put("supplier",id);
		}
		return SUCCESS;
	}

	public String init() {
		ActionContext.getContext().getSession().put("all_goods",this.goodsDao.getAllGoods());
		ActionContext.getContext().getSession().put("all_goods_id",this.goodsDao.getAllGoodsId());
		return SUCCESS;
	}
    public String insect(){
    	if(getKinds()!=null && getName()!=null && getPrice()!=0){
    		int supplier =(int) ActionContext.getContext().getSession().get("user_id");
        	goodsDao.insect(getKinds(), getName(), getPrice(), 0,supplier);
        	ActionContext.getContext().getSession().put("all_goods", this.goodsDao.getAllGoods());
    	}
    	return SUCCESS;
    }

    public String update(){
    	if(getKinds()!=null && getName()!=null && getPrice()!=0){
        	HttpServletRequest request=ServletActionContext.getRequest();
        	if(request.getParameter("goodsId")!=null && getKinds()!=null && getName()!=null && getPrice()!=0){
            	String goods_id=request.getParameter("goodsId");
            	int id=Integer.parseInt(goods_id);
            	System.out.print(id+"--------------------");
            	this.goodsDao.update(id, getKinds(), getName(), getPrice());
            	ActionContext.getContext().getSession().put("all_goods", this.goodsDao.getAllGoods());
        	}
    	}
    	return SUCCESS;
    }
    
    public String delete() throws Exception{
    	HttpServletRequest request=ServletActionContext.getRequest();
    	if(request.getParameter("goodsId")!=null){
    		String goods_id=request.getParameter("goodsId");
    		int id=Integer.parseInt(goods_id);
        	System.out.print(id+"--------------------");
        	this.goodsDao.delete(id);
        	ActionContext.getContext().getSession().put("all_goods", this.goodsDao.getAllGoods());
    	}	
    	return SUCCESS;
    }
    
    public void select(){
    	
    }
    
    public String getKinds(){
    	return this.kinds;
    }
    
    public void setKinds(String kinds){
    	this.kinds=kinds;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@Override
    public String execute() throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();

		if(!request.getParameter("kinds").equals("请输入")
				&& !request.getParameter("name").equals("请输入") && !request.getParameter("price").equals("0")){
			String goods_id=request.getParameter("goods_id");
			Integer.parseInt(goods_id);
			String kinds=request.getParameter("kinds");
			String name=request.getParameter("name");
			String price=request.getParameter("price");
		int goodsid=Integer.parseInt(goods_id );
		int price_=Integer.parseInt(price);
		this.goodsDao.update(goodsid, kinds, name,price_);
		ActionContext.getContext().getSession().put("all_goods", this.goodsDao.getAllGoods());
		}
		return SUCCESS;
    }
	
}

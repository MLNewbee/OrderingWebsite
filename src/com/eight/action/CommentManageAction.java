package com.eight.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.eight.beans.Comment;
import com.eight.daos.CommentDao;

public class CommentManageAction extends ActionSupport {
	
	  private Map<String,Object> session;
	  
      private Comment aComment= new Comment();
      private CommentDao aCommentDao=new CommentDao();
      public String insert()
      {
    	try {
    		System.out.println("--------执行到------insert-----"+aComment.getComment());
    		aCommentDao.insert(new Comment(aComment.getStar(),aComment.getComment()));
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	return SUCCESS;
      }
      public String update()
      {
    	  ActionContext context = ActionContext.getContext();
    	  session = context.getSession();
    	  try {
			aCommentDao.update(new Comment(aComment.getStar(),aComment.getComment()),(int) session.get("id"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	  return SUCCESS;
      }
      public String delete()
      {
    	  ActionContext context = ActionContext.getContext();
    	  session = context.getSession();
    	  try {
			aCommentDao.delete((int) session.get("id"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	  return SUCCESS;
      }
      public String select()
      {   
    	  ActionContext context = ActionContext.getContext();
    	  session = context.getSession();
    	  session.put("id", 1);
			try {
				aComment = aCommentDao.select((int) session.get("id"));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(aComment.getComment()==null){
				System.out.println("---------------执行到这里了------error-----");
				return ERROR;
			}
			session.put("star",aComment.getStar());
			session.put("comment",aComment.getComment());
			System.out.println("---------------执行到这里了-------success----");
    	  return SUCCESS;
      }
      
	public Comment getaComment() {
		return aComment;
	}
	public void setaComment(Comment aComment) {
		this.aComment = aComment;
	}
      
      
}

package com.ecommerce.dao;

import java.sql.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecommerce.entity.Purchase; 

@Repository
@Component
public class PurchaseDAO {

	@Autowired
    private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public Purchase getPurchaseById(long id) {
		String strId = String.valueOf(id);
		List<Purchase> list = this.sessionFactory.getCurrentSession().createQuery("from Purchase where id=" + strId).list();
		if (list.size() > 0)
			return (Purchase) list.get(0);
		else
			return null;
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Purchase> getAllItems() {
		List<Purchase> list = this.sessionFactory.getCurrentSession().createQuery("from Purchase order by ID desc").list();
		return list;
	}	
		
	@SuppressWarnings("unchecked")
	public List<Purchase> getAllItemsByUserId(long userId) {
		String strId = String.valueOf(userId);
		List<Purchase> list = this.sessionFactory.getCurrentSession().createQuery("from Purchase where user_id=" + strId + " order by ID desc").list();
		return list;
	}	
	@SuppressWarnings("unchecked")
	public List<Purchase> getAllItemsByDate(Date date)
	{
		
		String date_s = String.valueOf(date);
		String date_s_l= date_s+" 00:00:00.0";
		String date_s_u= date_s+" 23:59:59.0";
		System.out.println("Date selected"+date+" str"+ date_s);
		List<Purchase> list = this.sessionFactory.getCurrentSession().createQuery("from Purchase where date BETWEEN '" + date_s_l + "' AND '"+date_s_u+"' order by ID desc").list();
		System.out.println(date_s+":   "+list.size());
		return list;
	}
	@SuppressWarnings("unchecked")
	public long  updatePurchase(Purchase purchase) {
		String sql = "";
		long newId = 0;
		if (purchase.getID() == 0) {
			this.sessionFactory.getCurrentSession().save(purchase);
			newId = purchase.getID();
		} else {
			Query query = this.sessionFactory.getCurrentSession().createQuery(sql);
			query.setParameter("user_id", purchase.getUserId());
			query.setParameter("gross_total", purchase.getTotal());
			
			query.executeUpdate();
		}
		return newId;
	}

	public void deletePurchase(long id) {
		// TODO Auto-generated method stub
		
	}
	@SuppressWarnings("unchecked")
	public List<Purchase> getAllItemsByCategory(String category) {
		
		List<Purchase> list = this.sessionFactory.getCurrentSession().createQuery("from Purchase_items Where product_id is in( Select  order by ID desc").list();
		return list;
	}
	

	
}

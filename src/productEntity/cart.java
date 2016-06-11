package productEntity;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;


import database.database;

public class cart {
	private HashMap<product,Integer> goods;
	private double totalPrice;

	public cart()
	{
		goods = new HashMap<product,Integer>();
		totalPrice = 0.0;
	}
	
	
	public HashMap<product, Integer> getGoods() {
		return goods;
	}

	public void setGoods(HashMap<product, Integer> goods) {
		this.goods = goods;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}	
	
	public boolean addGoodsInCart(product item ,int number)
	{
		if(goods.containsKey(item))
		{
			goods.put(item, goods.get(item)+number);
		}
		else
		{
			goods.put(item, number);	
		}
		calTotalPrice();
		return true;
	}
	
	public boolean removeGoodsFromCart(product item)
	{
		goods.remove(item);
		calTotalPrice();    //重新计算价格
		return true;
	}
	
	public double calTotalPrice()
	{
		//计算总价
		double sum = 0.0;
		Set<product> keys = goods.keySet();
		Iterator<product> it = keys.iterator();
	    while(it.hasNext())
	    {
	    	product i = it.next();
	    	sum += i.getPrice()* goods.get(i);
	    }
	    this.setTotalPrice(sum);
	    return this.getTotalPrice();
	}

}

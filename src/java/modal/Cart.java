/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author OS
 */
public class Cart {
    private List <ItemCart> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<ItemCart> items) {
        this.items = items;
    }

    public List<ItemCart> getItems() {
        return items;
    }

    public void setItems(List<ItemCart> items) {
        this.items = items;
    }
    
    public ItemCart getItemById (int id) {
        for (ItemCart i:items) {
            if(i.getBook().getId() == id)
                return i;
        }
        return null;
    }
    
    public int getQuantityById (int id) {
        return getItemById(id).getQuantity();
    }
    
    public void addItem (ItemCart t) {
        if (getItemById(t.getBook().getId()) != null) {
            ItemCart m = getItemById(t.getBook().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        }
        else {
            items.add(t);
        }
    }
    
    public void removeItem (int id) {
        if(getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }
    
    public double getTotalMoney () {
        double t = 0;
        for (ItemCart i : items) {
            t += i.getQuantity()*i.getPrice();
        }
        return t;
    }
}

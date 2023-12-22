/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import modal.Account;
import modal.Book;
import modal.Cart;
import modal.Category;
import modal.ItemCart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import modal.Order;
import modal.OrderDetail;

/**
 *
 * @author OS
 */
public class OrderDAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void addOrder(Account a, Cart cart) {
//        LocalDate date = java.time.LocalDate.now();
//        LocalTime time = java.time.LocalTime.now();
//        
//        String order_date = date.toString() + " " + time.toString();
        
        try {
            String query = "insert into [order] values (GETDATE(), ?, ?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
//            ps.setString(1, order_date);
            ps.setInt(1, a.getId());
            ps.setDouble(2, cart.getTotalMoney());
            ps.executeUpdate();

            //lấy id của Order vừa add.
            String query2 = "Select top 1 order_id from [order] order by order_id desc";
            PreparedStatement ps2 = conn.prepareStatement(query2);
            rs = ps2.executeQuery();
            
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (ItemCart i : cart.getItems()) {
                    String query3 = "Insert into order_line values (?, ?, ?, ?)";
                    PreparedStatement ps3 = conn.prepareStatement(query3);
                    ps3.setInt(1, oid);
                    ps3.setInt(2, i.getBook().getId());
                    ps3.setInt(3, i.getQuantity());
                    ps3.setDouble(4, i.getPrice());
                    ps3.executeUpdate();
                    
                    String query4 = "update book set [book_quantity] = ? where book_id = ?";
                    PreparedStatement ps4 = conn.prepareStatement(query4);
                    int new_quantity = i.getBook().getQuantity() - i.getQuantity();
                    ps4.setInt(1, new_quantity);
                    ps4.setInt(2, i.getBook().getId());
                    ps4.executeUpdate();
                }
            }
            
        } catch (Exception e) {
        }
    }

//        public void updateQuantity (String quantity, String id) {
//        String query = "update book set [book_quantity] = ? where book_id = ?";
//        
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, quantity);
//            ps.setString(2, id);
//        } catch (Exception e) {
//        }
//    }
    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String query = "select * from [order]";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Order> getOrderByAid(int aid) {
        List<Order> list = new ArrayList<>();
        String query = "select * from [order] where account_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, aid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<OrderDetail> getOrderDetailByOid(String aid) {
        List<OrderDetail> list = new ArrayList<>();
        String query = "select * from order_line where order_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, aid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDouble(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
}

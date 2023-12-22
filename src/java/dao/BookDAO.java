/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import modal.Category;
import modal.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author manh2
 */
public class BookDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Book> getAllBook() {
        List<Book> list = new ArrayList<>();
        String query = "select * from book";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getDouble(4), 
                        rs.getInt(5), 
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Book> getBookByCID(String cid) {
        List<Book> list = new ArrayList<>();
        String query = "select * from book\n"
                + "where category_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Book> searchByName(String txtSearch) {
        List<Book> list = new ArrayList<>();
        String query = "select * from book\n"
                + "where book_name like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1,"%"+ txtSearch+"%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Book getBookByID(String id) {
        String query = "select * from book\n"
                + "where book_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Book(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Book getLast() {
        String query = "select top 1 * from book\n"
                + "order by id desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Book(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void DeleteBook (String id) {
        String query = "delete from book where book_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void AddBook (String name, String image, String price, String quantity, String desc, String author ,String category){
        String query = "INSERT [dbo].[book] ([book_name], [book_img], [book_price], [book_quantity], [book_desc], [author], [category_id]) \n" +
                        "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, quantity);
            ps.setString(5, desc);
            ps.setString(6, author);
            ps.setString(7, category);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void EditBook (String name, String image, String price, String quantity, String desc, String author, String category, String id){
        String query = "update book\n" +
                        "set [book_name] = ?,\n" +
                        "[book_img] = ?,\n" +
                        "[book_price] = ?,\n" +
                        "[book_quantity] = ?,\n" +
                        "[book_desc] = ?,\n" +
                        "[author] = ?,\n" +
                        "[category_id] = ?\n" +
                        "where book_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, quantity);
            ps.setString(5, desc);
            ps.setString(6, author);
            ps.setString(7, category);
            ps.setString(8, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    public static void main(String[] args) {
        BookDAO dao = new BookDAO();
        List<Book> list = dao.getAllBook();
        List<Category> listC = dao.getAllCategory();

//        for (Book o : list) {
//            System.out.println(o);
//        }
        
        Book k = dao.getBookByID("1");
        System.out.println(k);
    }
}

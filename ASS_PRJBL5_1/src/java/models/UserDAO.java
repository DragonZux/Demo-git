/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author DMX THANH SON
 */
public class UserDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public boolean checkUser(String account, String password) {

        try {
            String strSQL = "SELECT * FROM  Account where username = ? and password = ? and isAdmin = 0";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, account);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkUser:" + e.getMessage());
        }
        return false;
    }

    public boolean checkadmin(String account, String password) {

        try {
            String strSQL = "SELECT * FROM Account where username = ? and password = ? and isAdmin = 1";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, account);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkUser:" + e.getMessage());
        }
        return false;
    }

    public boolean checkAccountContain(String account) {

        try {
            String strSQL = "Select * from Account where username = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, account);

            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkUser:" + e.getMessage());
        }
        return false;
    }

    public void addAccount(user u) {
        try {
            String strSQL = "insert into Account(fullname, username, password, phone, isAdmin,id,answer) values (?, ?, ?, ?, ?, ?, ?)";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, u.getFullname());
            stm.setString(2, u.getUsername());
            stm.setString(3, u.getPassword());

            stm.setString(4, u.getPhone());
            stm.setInt(5, 0); // Set giá trị mặc định cho trường "isAdmin" là 0
            stm.setString(6, u.getId());
            stm.setString(7, u.getAnswer());
            stm.execute();
        } catch (Exception e) {
            System.out.println("add" + e.getMessage());
        }
    }

    public void addAccountByAdmin(user u) {
        try {
            String strSQL = "insert into Account(fullname, username, password, phone, isAdmin) values (?, ?, ?, ?, ?)";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, u.getFullname());
            stm.setString(2, u.getUsername());
            stm.setString(3, u.getPassword());
            stm.setString(4, u.getPhone());
            stm.setString(5, u.getIsAdmin()); // Set giá trị mặc định cho trường "isAdmin" là 0
            stm.execute();
        } catch (Exception e) {
            System.out.println("add" + e.getMessage());
        }
    }

    public ArrayList<user> getUser() {
        ArrayList<user> data = new ArrayList<user>();

        try {
            String strSQL = "SELECT * FROM Account ";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String aid = String.valueOf(rs.getInt(1));
                String fullname = rs.getString(2);
                String username = rs.getString(3);
                String password = rs.getString(4);
                String phone = rs.getString(5);
                String isAdmin = String.valueOf(rs.getInt(6));
                String id = rs.getString(7);
                String answer = rs.getString(8);
                user u = new user(aid, fullname, username, password, phone, isAdmin, id, answer);
                data.add(u);
            }
        } catch (Exception e) {
            System.out.println("getUser:" + e.getMessage());//cau lenh nay hien ra neu co loi thi se loi o ham nao
        }
        return data;
    }

    public void deleteAdmin(String id) {
        try {
            String strSQL = "delete from Account where aid = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, id);
            stm.execute();
        } catch (Exception e) {
            System.out.println("delete" + e.getMessage());
        }
    }

    public user getUserId(String aid) {
        try {
            String strSQL = "SELECT * FROM Account WHERE aid = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, aid);
            rs = stm.executeQuery();
            while (rs.next()) {
//                String aid = String.valueOf(rs.getInt(1));
                String fullname = rs.getString(2);
                String username = rs.getString(3);
                String password = rs.getString(4);
                String phone = rs.getString(5);
                String isAdmin = String.valueOf(rs.getInt(6));
                String id = rs.getString(7);
                String answer = rs.getString(8);
                return new user(aid, fullname, username, password, phone, isAdmin, id, answer);
            }
        } catch (Exception e) {
            System.out.println("getUserId" + e.getMessage());
        }
        return null;
    }

    public void UpdateAccount(String role, String id) {
        try {
            String strSQL = "Update Account set isAdmin=? where aid=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, role); // Set giá trị mặc định cho trường "isAdmin" là 0
            stm.setString(2, id);
            stm.execute();
        } catch (Exception e) {
            System.out.println("add" + e.getMessage());
        }
    }

    public void UpdateUser(String role, String id) {
        try {
            String strSQL = "Update Account set isAdmin=? where aid=?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, role); // Set giá trị mặc định cho trường "isAdmin" là 0
            stm.setString(2, id);
            stm.execute();
        } catch (Exception e) {
            System.out.println("add" + e.getMessage());
        }
    }

    public user getUserByAccount(String account) {
        user u = new user();
        try {
            String strSQL = "Select * from Account where username = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, account); // Set giá trị mặc định cho trường "isAdmin" là 0

            rs = stm.executeQuery();
            while (rs.next()) {
                String aid = String.valueOf(rs.getInt(1));
                String fullname = rs.getString(2);
                String username = rs.getString(3);
                String password = rs.getString(4);
                String phone = rs.getString(5);
                String isAdmin = String.valueOf(rs.getInt(6));
                return new user(aid, fullname, username, password, phone, isAdmin, aid, password);
            }
        } catch (Exception e) {
            System.out.println("add" + e.getMessage());
        }
        return u;
    }

    public void UpdateUserManagement(String id, String fullname, String username, String password, String phone) {
        try {
            String strSQL = "UPDATE Account SET fullname = ?, username = ?, password = ?, phone = ? WHERE aid = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, fullname);
            stm.setString(2, username);
            stm.setString(3, password);
            stm.setString(4, phone);
            stm.setString(5, id);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public ArrayList<question> getQuestion() {
        ArrayList<question> data = new ArrayList<question>();

        try {
            String strSQL = "SELECT * FROM Questions ";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = Integer.valueOf(rs.getInt(1));
                String question = rs.getString(2);

                question q = new question(id, question);
                data.add(q);
            }
        } catch (Exception e) {
            System.out.println("getQuestion:" + e.getMessage());//cau lenh nay hien ra neu co loi thi se loi o ham nao
        }
        return data;
    }

    public user checkAccExist(String user) {
        String sql = "select * from Account\n"
                + "where username = ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new user(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public boolean checkAnswer(String username, String question, String answer) {
        String sql = "select * from Account a\n"
                + "join Questions q\n"
                + "on a.id = q.id\n"
                + "where a.username LIKE ? AND q.content LIKE ? AND a.answer LIKE ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, question);
            st.setString(3, answer);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;

    }

    public void resetPassword(String username, String newpassword) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [password] = ?   \n"
                + " WHERE username = ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newpassword);
            st.setString(2, username);
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
 
 public ArrayList<user> getUserByUserName2(String username) {
    ArrayList<user> search = new ArrayList<user>();

    try {
        String strSQL = "select * from Account WHERE username like ?";
        stm = connection.prepareStatement(strSQL);
        stm.setString(1, "%" + username + "%");
        rs = stm.executeQuery();
        while (rs.next()) {
            String aid = String.valueOf(rs.getInt(1));
            String fullname = rs.getString(2);
            String password = rs.getString(4);
            String phone = rs.getString(5);
            String isAdmin = String.valueOf(rs.getInt(6));
            String id = rs.getString(7);
            String answer = rs.getString(8);
            user u = new user(aid, fullname, username, password, phone, isAdmin, id, answer);
            search.add(u);
        }
    } catch (SQLException e) {
        System.out.println("getUser:" + e.getMessage());
    }
    return search;
}
 public ArrayList<user> getUserByUsername(String username) {
    ArrayList<user> searchResult = new ArrayList<>();

    try {
        // Chuẩn bị câu lệnh SQL
        String query = "SELECT * FROM Account WHERE username LIKE ?";
        
        // Tạo đối tượng PreparedStatement
        PreparedStatement statement = connection.prepareStatement(query);
        
        // Thiết lập tham số cho câu lệnh SQL
        statement.setString(1, "%" + username + "%");
        
        // Thực thi câu lệnh SQL và nhận kết quả
        ResultSet resultSet = statement.executeQuery();
        
        // Duyệt qua kết quả và thêm vào danh sách kết quả tìm kiếm
        while (resultSet.next()) {
            user user = new user();
            user.setAid(String.valueOf(resultSet.getInt("aid")));
            user.setFullname(resultSet.getString("fullname"));
            user.setUsername(resultSet.getString("username"));
            user.setPassword(resultSet.getString("password"));
            user.setPhone(resultSet.getString("phone"));
            user.setIsAdmin(String.valueOf(resultSet.getInt("isAdmin")));
            user.setId(resultSet.getString("id"));
            user.setAnswer(resultSet.getString("answer"));
            searchResult.add(user);
        }
        
        // Đóng kết nối và tài nguyên
        resultSet.close();
        statement.close();
    } catch (SQLException e) {
        // Xử lý ngoại lệ nếu có
        System.out.println("Error: " + e.getMessage());
    }
    
    // Trả về danh sách kết quả tìm kiếm
    return searchResult;
}

    public static void main(String[] args) {
        UserDAO da = new UserDAO();
        System.out.println(da.getUserByUserName2("admin"));
    }
   
}

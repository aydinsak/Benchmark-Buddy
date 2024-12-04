/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Device;

/**
 *
 * @author Aydin Shidqi
 */
public class DeviceDAO {

    private final String url = "jdbc:mysql://localhost:3306/benchmarkbuddy";
    private final String user = "root";
    private final String pasword = "";

    public DeviceDAO() {
    }

    public List<Device> getRecommendedDevice(String processor, String GpuType, int RAM) {

        List<Device> devices = new ArrayList<>();
        String sql = "SELECT * FROM device WHERE processor LIKE ? AND graphicsCardType LIKE ? AND memory = ? ";

        try (Connection conn = DriverManager.getConnection(url, user, pasword); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, "%" + processor + "%");
            stmt.setString(2, "%" + GpuType + "%");
            stmt.setInt(3, RAM);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int device_id = rs.getInt("device_id");

                String name = rs.getString("name");
                String brand = rs.getString("brand");
                String category = rs.getString("category");
                int price = rs.getInt("price");
                String operatingSystem = rs.getString("operatingSystem");
                String battery = rs.getString("battery");
                String storage = rs.getString("storage");
                int memory = rs.getInt("memory");
                String display = rs.getString("display");
                String graphicsCard = rs.getString("graphicsCard");
                String graphicsCardType = rs.getString("graphicsCardType");
                String Processor = rs.getString("processor");
                String url = rs.getString("url");
                String poster_url = rs.getString("poster_url");

                devices.add(new Device(device_id, name, brand, category, price, operatingSystem, battery, storage, memory, display, graphicsCard, graphicsCardType, Processor));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return devices;

    }

    public List<Device> selectFilterGaming(String category) {
        String sql = "SELECT * FROM device WHERE category LIKE ?";
        List<Device> devices = new ArrayList<>();
        
         try (Connection conn = DriverManager.getConnection(url, user, pasword); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, "%" + category + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int device_id = rs.getInt("device_id");

                String name = rs.getString("name");
                String brand = rs.getString("brand");
                String Category = rs.getString("category");
                int price = rs.getInt("price");
                String operatingSystem = rs.getString("operatingSystem");
                String battery = rs.getString("battery");
                String storage = rs.getString("storage");
                int memory = rs.getInt("memory");
                String display = rs.getString("display");
                String graphicsCard = rs.getString("graphicsCard");
                String graphicsCardType = rs.getString("graphicsCardType");
                String Processor = rs.getString("processor");
                String url = rs.getString("url");
                String poster_url = rs.getString("poster_url");

                devices.add(new Device(device_id, name, brand, Category, price, operatingSystem, battery, storage, memory, display, graphicsCard, graphicsCardType, Processor));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return devices;
    }

}

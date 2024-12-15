/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import dao.DeviceDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Device;
import model.Preference;
import model.User;

/**
 *
 * @author Aydin Shidqi
 */
@WebServlet(name = "DeviceServlet", urlPatterns = {"/DeviceServlet"})
@MultipartConfig 
public class DeviceServlet extends HttpServlet {
    private final String uploadDirectory = "C:/images_device";

    private UserDAO userDAO;
    private DeviceDAO deviceDAO;

    public DeviceServlet() {
        userDAO = new UserDAO();
        deviceDAO = new DeviceDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("rekomendasiDevice".equals(action)) {
            getRekomendasiDevice(request, response);
        } else if ("filterByCategory".equals(action)) {
             getDeviceByCategory(request,response);
        }else if("showDevices".equals(action)){
            ShowDevices(request,response);
        }
    }
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("tambahDevice".equals(action)) {
           tambahDevice(request,response);
        } 
    }

    protected void getRekomendasiDevice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user from session
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            throw new ServletException("User is not logged in or session has expired.");
        }

        // Get user preferences
        Preference preference = user.getPreference();
        if (preference == null) {
            throw new ServletException("User preferences are not set.");
        }

        List<Device> devices = deviceDAO.getRecommendedDevice(
                preference.getProcessor(),
                preference.getGraphicsCardType(),
                preference.getMemory()
        );

        // Set recommended devices to request and forward to JSP (or return as JSON)
         request.getSession().setAttribute("filteredDevice", null);
        request.getSession().setAttribute("recommendedDevices", devices);
        response.sendRedirect(request.getContextPath() +"/Pages/rekomendasiDevice.jsp");

    }
    
    protected void getDeviceByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String category=request.getParameter("category");
       
       List<Device>FilteredDevices=deviceDAO.selectFilter(category);
       if(FilteredDevices==null || FilteredDevices.isEmpty()){
           request.getSession().setAttribute("filteredDevice",null);
       }else{
            request.getSession().setAttribute("filteredDevice", FilteredDevices);
       }
      
        request.getSession().setAttribute("recommendedDevices", null);
       response.sendRedirect(request.getContextPath() +"/Pages/rekomendasiDevice.jsp");
       
    }
    
     protected void ShowDevices(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int device_id=Integer.parseInt(request.getParameter("idDevices"));
       
       Device singleDevice=deviceDAO.selectDevice(device_id);
       if(singleDevice==null){
           request.getSession().setAttribute("singleDevice",null);
       }else{
            request.getSession().setAttribute("singleDevice", singleDevice);
       }
       
       
        response.sendRedirect(request.getContextPath() +"/Pages/showDevice.jsp");
       
      
       
    }
     
     protected void tambahDevice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract parameters from the request
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String category = request.getParameter("category");
        int price = Integer.parseInt(request.getParameter("price"));
        String operatingSystem = request.getParameter("operatingSystem");
        String battery = request.getParameter("battery");
        String storage = (request.getParameter("storage"));
        int memory = Integer.parseInt(request.getParameter("memory"));
        String display = request.getParameter("display");
        String graphicsCard = request.getParameter("graphicsCard");
        String graphicsCardType = request.getParameter("graphicsCardType");
        String processor = request.getParameter("processor");
        String url = request.getParameter("url");

        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();
        String filePath = uploadDirectory + File.separator + fileName;

        // Save the file to the server
        File fileSaveDir = new File(uploadDirectory);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs(); // Create the directory if it does not exist
        }
        filePart.write(filePath);

        // Relative path to store in the database
        String relativePath = "images_device/" + fileName;
        // Call the DAO to insert the device into the database
        boolean deviceAdded = deviceDAO.insertDevice(
                name, brand, category, price, operatingSystem, battery,
                storage, memory, display, graphicsCard, graphicsCardType,
                processor, url, relativePath
        );

        // Handle the result of the operation
        if (deviceAdded) {
            response.getWriter().println("Berhasil"); // Redirect to the device list page
        } else {
            response.getWriter().println("Failed to add the device. Please try again.");
        }
    }

}

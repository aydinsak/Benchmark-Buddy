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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Device;
import model.Preference;
import model.User;

/**
 *
 * @author Aydin Shidqi
 */
@WebServlet(name = "DeviceServlet", urlPatterns = {"/DeviceServlet"})
public class DeviceServlet extends HttpServlet {

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
        } else if ("".equals(action)) {

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
        request.getSession().setAttribute("recommendedDevices", devices);
        response.sendRedirect(request.getContextPath() +"/Pages/rekomendasiDevice.jsp");

    }

}

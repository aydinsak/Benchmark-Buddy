<%-- 
    Document   : showDevice
    Created on : 6 Dec 2024, 20.57.19
    Author     : Aydin Shidqi
--%>

<%@page import="model.Device"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Benchmark Buddy</title>
        <style>
            main {
                max-width: 800px;
                margin: 20px auto;
                padding: 20px;
                background: white;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
            }

            .product-title {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .product-price {
                font-size: 22px;
                color: #ff6600;
                margin: 10px 0;
            }

            .category {
                font-size: 16px;
                margin-bottom: 20px;
            }
            .price {
                font-size: 16px;
                margin-bottom: 20px;
            }

            .shop-button {
                display: flex;
                align-items: center;
                margin-top: 20px;
                font-size: 16px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                text-align: left;
                padding: 8px;
                border: 1px solid #ddd;
            }

            th {
                background-color: #ff6600;
                color: white;
            }

            img.product-image {
                max-width: 50%;
                border-radius: 5px;
                margin-bottom: 20px;
            }

            a{
                text-decoration: none;
            }

            .btn-back {
                margin: 10px 0 20px 20px; /* Atur jarak sesuai kebutuhan */
                background-color: #ff6a00;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 1rem;
                border-radius: 5px;
                cursor: pointer;
                text-align: center;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .btn-back:hover {
                background-color: #e65a00;
                transform: scale(1.05);
            }

            .rounded-lg {
                border-radius: 10px;
            }

        </style>
    </head>
    <%
        Device device = (Device) request.getSession().getAttribute("singleDevice");
    %>
    <body>
        <%@include file="header.jsp"%>
        <button type="button" class="btn btn-back rounded-lg" onclick="window.location.href = '${pageContext.request.contextPath}/Pages/rekomendasiDevice.jsp'">
            Kembali ke List Rekomendasi
        </button>

        <!--            <a href="https://ibb.co.com/2Zf7Mdv" class="product-link">
                        <img src="<%= device.getPoster_url()%>" alt="Laptop" border="0" class="product-image" />
                    </a>-->

        <%
            String posterUrl = device.getPoster_url();
            String finalUrl = posterUrl.contains("images_device")
                    ? ((HttpServletRequest) request).getContextPath() + "/" + posterUrl
                    : posterUrl;
        %>
        <img src="<%= finalUrl%>" alt="laptop-img" class="product-image">
        <div class="product-title"><%= device.getName()%></div>
        <div class="product-price"><%= device.getName()%></div>
        <div class="price">Harga: Rp.<%= device.getPrice()%></div>
        <div class="category">Kategori: <%= device.getCategory()%> Laptop</div>

        <%
                if (!device.getUrl().isEmpty()) {%>
        <div class="shop-button"><a href="<%= device.getUrl()%>" target="_blank">Official Website</a> </div>
        <%
            }
        %>
        <table>
            <tr>
                <th>Spesifikasi</th>
                <th>Detail</th>
            </tr>
            <tr>
                <td>Sistem Operasi</td>
                <td><%= device.getOperatingSystem()%></td>
            </tr>
            <tr>
                <td>Prosesor</td>
                <td><%= device.getProcessor()%></td>
            </tr>
            <tr>
                <td>Kartu Grafis</td>
                <td><%= device.getGraphicsCard()%></td>
            </tr>
            <tr>
                <td>Jenis Kartu Grafis</td>
                <td><%= device.getGraphicsCardType()%></td>
            </tr>
            <tr>
                <td>Penyimpanan</td>
                <td><%= device.getStorage()%></td>
            </tr>
            <tr>
                <td>Display</td>
                <td><%= device.getDisplay()%></td>
            </tr>
            <tr>
                <td>Baterai</td>
                <td><%= device.getBattery()%></td>
            </tr>
        </table>

    </body>
</html>


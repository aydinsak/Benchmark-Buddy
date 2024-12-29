<%@page import="java.util.List"%>
<%@page import="model.Device"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compare Devices - Benchmark Buddy</title>
    <style>
        main {
            max-width: 900px;
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

        .comparison-container {
            display: flex;
            justify-content: space-between;
        }

        .device-column {
            width: 48%;
        }

        .btn-back {
            margin: 10px 0 20px 20px;
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
    </style>
</head>

<%
    // Ambil daftar perangkat dari session
    List<Device> devices = (List<Device>) request.getSession().getAttribute("selectedDevices");
%>

<body>
    <%@include file="header.jsp"%>

    <button type="button" class="btn btn-back rounded-lg" onclick="window.location.href = '${pageContext.request.contextPath}/Pages/rekomendasiDevice.jsp'">
        Kembali ke List Rekomendasi
    </button><br>

    <% if (devices != null && !devices.isEmpty()) { %>
        <div class="comparison-container">
            <% for (Device device : devices) { %>
                <div class="device-column">
                    <h2 class="product-title"><%= device.getName() %></h2>
                    <img src="<%= device.getPoster_url() %>" alt="<%= device.getName() %>" class="product-image">
                    <div class="product-price">Rp.<%= device.getPrice() %></div>
                    <div class="category">Kategori: <%= device.getCategory() %></div>
                    <table>
                        <tr>
                            <th>Spesifikasi</th>
                            <th>Detail</th>
                        </tr>
                        <tr>
                            <td>Sistem Operasi</td>
                            <td><%= device.getOperatingSystem() %></td>
                        </tr>
                        <tr>
                            <td>Prosesor</td>
                            <td><%= device.getProcessor() %></td>
                        </tr>
                        <tr>
                            <td>Kartu Grafis</td>
                            <td><%= device.getGraphicsCard() %></td>
                        </tr>
                        <tr>
                            <td>Jenis Kartu Grafis</td>
                            <td><%= device.getGraphicsCardType() %></td>
                        </tr>
                        <tr>
                            <td>Penyimpanan</td>
                            <td><%= device.getStorage() %></td>
                        </tr>
                        <tr>
                            <td>Display</td>
                            <td><%= device.getDisplay() %></td>
                        </tr>
                        <tr>
                            <td>Baterai</td>
                            <td><%= device.getBattery() %></td>
                        </tr>
                    </table>
                </div>
            <% } %>
        </div>
    <% } else { %>
        <p>Perangkat yang dipilih tidak valid atau tidak ditemukan. Harap pilih perangkat yang ingin dibandingkan.</p>
    <% } %>
</body>
</html>

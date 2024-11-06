<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="demo.healthmonitoring.services.PatientService" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Patients</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 20px 0;
        }
        .container {
            margin: 50px auto;
            width: 80%;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            display: inline-block;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
         .dashboard-link {
        font-size: 18px;
        color: white;
        text-decoration: none;
        padding: 10px 20px;
        background-color: #0056b3;
        border-radius: 5px;
        margin-right: 20px;
    }

    .dashboard-link:hover {
        background-color: #00408b;
    }
    </style>
</head>
<body>

    <div class="header">
        <h1>Patient List</h1>
                    <a href="/admin-dashboard" class="dashboard-link">Dashboard</a>
        
    </div>

    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Health Issue</th>
                    <th>Date of Visit</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${patients}" var="patient">
                    <tr>
                        <td>${patient.id}</td>
                        <td>${patient.name}</td>
                        <td>${patient.age}</td>
                        <td>${patient.healthIssue}</td>
                        <td>${patient.dateOfVisit}</td>
                        <td>
                            <!-- Edit button -->
                            <a href="${pageContext.request.contextPath}/edit-patient/${patient.id}" class="btn">Edit</a>

                            <!-- Delete button -->
                            <form action="${pageContext.request.contextPath}/delete-patient/${patient.id}" method="post" style="display:inline;">
    <input type="submit" class="btn btn-delete" value="Delete" onclick="return confirm('Are you sure you want to delete this patient?');"/>
</form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="/add-patient" class="btn">Add New Patient</a>
    </div>

</body>
<footer style="text-align: center; margin-top: 190px; padding: 10px; background-color: #f4f4f4;">
    <p>&copy; 2024 Sharmistha Pal. All rights reserved.</p>
</footer>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Patient</title>
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
            width: 50%;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        form label {
            display: block;
            margin: 15px 0 5px;
            font-weight: bold;
        }
        form input[type="text"],
        form input[type="number"],
        form input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 16px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
            font-size: 16px;
        }
        .back-link:hover {
            color: #0056b3;
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
        <h1>Edit Patient</h1>
            <a href="/admin-dashboard" class="dashboard-link">Dashboard</a>
        
    </div>

    <div class="container">
        <form action="${pageContext.request.contextPath}/edit-patient/${patient.id}" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${patient.name}" required>

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" value="${patient.age}" required>

            <label for="healthIssue">Health Issue:</label>
            <input type="text" id="healthIssue" name="healthIssue" value="${patient.healthIssue}" required>

            <label for="dateOfVisit">Date of Visit:</label>
            <input type="date" id="dateOfVisit" name="dateOfVisit" value="${patient.dateOfVisit}" required>

            <button type="submit">Save</button>
        </form>

        <a href="${pageContext.request.contextPath}/view-patients" class="back-link">Back to Patient List</a>
    </div>

</body>
<footer style="text-align: center; margin-top: 10px; padding: 10px; background-color: #f4f4f4;">
    <p>&copy; 2024 Sharmistha Pal. All rights reserved.</p>
</footer>
</html>

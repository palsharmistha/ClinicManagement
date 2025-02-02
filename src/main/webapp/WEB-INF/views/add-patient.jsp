<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Patient</title>
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
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
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
        <h1>Add Patient</h1>
                    <a href="/admin-dashboard" class="dashboard-link">Dashboard</a>
        
    </div>

    <div class="container">
        <form action="/add-patient" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="age">Age</label>
                <input type="number" id="age" name="age" required>
            </div>
            <div class="form-group">
                <label for="healthIssue">Health Issue</label>
                <input type="text" id="healthIssue" name="healthIssue" required>
            </div>
            <div class="form-group">
                <label for="dateOfVisit">Date of Visit</label>
                <input type="date" id="dateOfVisit" name="dateOfVisit" required>
            </div>
            <button type="submit" class="btn">Add Patient</button>
        </form>
    </div>
	
</body>
<footer style="text-align: center; margin-top: 70px; padding: 10px; background-color: #f4f4f4;">
    <p>&copy; 2024 Sharmistha Pal. All rights reserved.</p>
</footer>
	
</html>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
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
        .dashboard-container {
            display: flex;
            justify-content: space-around;
            margin-top: 50px;
        }
        .dashboard-card {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            width: 200px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .dashboard-card a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .dashboard-card:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome to the Admin Dashboard</h1>
    </div>

    <div class="dashboard-container">
        <div class="dashboard-card">
            <h2>Patients</h2>
            <p>Manage patients, add new patients, and view their details.</p>
            <a href="/view-patients">View Patients</a>
        </div>
        <div class="dashboard-card">
            <h2>Add Patient</h2>
            <p>Add a new patient to the system.</p>
            <a href="/add-patient">Add Patient</a>
        </div>
        <div class="dashboard-card">
            <h2>Reports</h2>
            <p>View health reports and analysis.</p>
            <a href="/reports">View Reports</a>
        </div>
    </div>
</body>
</html>

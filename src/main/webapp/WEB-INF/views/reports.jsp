<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patient Reports</title>
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
            margin-top: 20px;
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
        }
        .btn:hover {
            background-color: #0056b3;
        }
        label {
            font-weight: bold;
            margin-right: 10px;
        }
        form input[type="submit"], .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        form input[type="submit"]:hover, .btn:hover {
            background-color: #0056b3;
        }
        form input, select {
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
        }
    </style>
    <script>
    function deleteReport(reportId) {
        fetch(`/reports/delete-report/${reportId}`, {
            method: 'DELETE' // Ensure the method is DELETE
        })
        .then(response => {
            if (response.ok) {
                alert("Report deleted successfully"); // Show success alert
                window.location.href = "/reports"; // Redirect to the reports page
            } else {
                alert("Failed to delete report"); // Show failure alert
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert("An error occurred while deleting the report");
        });
    }



        function enableEditing(reportId) {
            document.getElementById("editButton-" + reportId).style.display = "none";
            document.getElementById("saveButton-" + reportId).style.display = "inline";
            document.getElementById("cancelButton-" + reportId).style.display = "inline";

            const reportRow = document.getElementById("row-" + reportId);
            const columns = reportRow.querySelectorAll("td");

            columns[1].innerHTML = `<input type="date" value="${columns[1].getAttribute("data-original-value")}" required />`;
            columns[2].innerHTML = `<input type="text" value="${columns[2].getAttribute("data-original-value")}" required />`;
            columns[3].innerHTML = `<textarea required>${columns[3].getAttribute("data-original-value")}</textarea>`;
        }

        function saveEditing(reportId) {
            const reportRow = document.getElementById("row-" + reportId);
            const columns = reportRow.querySelectorAll("td");

            const data = {
                reportDate: columns[1].querySelector("input").value,
                description: columns[2].querySelector("input").value,
                medicines: columns[3].querySelector("textarea").value
            };

            if (!validateFields(data)) {
                alert("Please fill in all fields before saving.");
                return;
            }

            fetch(`/reports/save/${reportId}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
            .then(response => response.json())
            .then(updatedData => {
                if (updatedData.success) {
                    columns[1].setAttribute("data-original-value", data.reportDate);
                    columns[2].setAttribute("data-original-value", data.description);
                    columns[3].setAttribute("data-original-value", data.medicines);

                    columns[1].innerText = data.reportDate;
                    columns[2].innerText = data.description;
                    columns[3].innerText = data.medicines;

                    document.getElementById("editButton-" + reportId).style.display = "inline";
                    document.getElementById("saveButton-" + reportId).style.display = "none";
                    document.getElementById("cancelButton-" + reportId).style.display = "none";
                } else {
                    alert("Failed to save changes.");
                }
            })
            .catch(error => {
                alert("An error occurred while saving changes: " + error.message);
            });
        }
        function deleteReport(reportId) {
            fetch(`/reports/delete-report/${reportId}`, {
                method: 'DELETE'
            })
            .then(response => {
                if (response.ok) {
                    window.location.reload(); // Reload the page after successful deletion
                } else {
                    alert('Failed to delete report');
                }
            })
            .catch(error => console.error('Error:', error));
        }


        function cancelEditing(reportId) {
            if (confirm("Are you sure you want to cancel the changes?")) {
                const reportRow = document.getElementById("row-" + reportId);
                const columns = reportRow.querySelectorAll("td");
                
                // Revert changes
                columns[1].innerText = columns[1].getAttribute("data-original-value");
                columns[2].innerText = columns[2].getAttribute("data-original-value");
                columns[3].innerText = columns[3].getAttribute("data-original-value");

                document.getElementById("editButton-" + reportId).style.display = "inline";
                document.getElementById("saveButton-" + reportId).style.display = "none";
                document.getElementById("cancelButton-" + reportId).style.display = "none";
            }
        }

        function validateFields(data) {
            return data.reportDate && data.description.trim() && data.medicines.trim();
        }

        // Function to handle the form submission
        document.addEventListener("DOMContentLoaded", function() {
            const form = document.querySelector("form[modelAttribute='report']");
            form.onsubmit = function(event) {
                event.preventDefault(); // Prevent the default form submission

                const formData = {
                    patientId: form.patient.id.value,
                    reportDate: form.reportDate.value,
                    description: form.description.value,
                    medicines: form.medicines.value
                };

                fetch("/reports/save", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(formData)
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert("Report saved successfully!");
                        // Optionally, you can refresh the reports table or update it dynamically here.
                        location.reload(); // Reload to see the new report added
                    } else {
                        alert("Failed to save report.");
                    }
                })
                .catch(error => {
                    alert("An error occurred: " + error.message);
                });
            };
        });
    </script>
</head>
<body>
    <div class="header">
        <h1>Patient Reports</h1>
        <a href="/admin-dashboard" class="dashboard-link">Dashboard</a>
    </div>

    <div class="container">
       <h2 style="text-align: center;">Report</h2>

        <form:form modelAttribute="report" action="/reports/save" method="post">
            <label for="patientSelect">Patient:</label>
            <form:select path="patient.id" id="patientSelect">
                <form:option value="">Select Patient</form:option>
                <form:options items="${patients}" itemValue="id" itemLabel="name"/>
            </form:select><br/>

            <label for="reportDate">Report Date:</label>
            <form:input path="reportDate" id="reportDate" type="date"/><br/>

            <label for="description">Description:</label>
            <form:input path="description" id="description" maxlength="255"/><br/>

            <label for="medicines">Medicines:</label>
            <form:input path="medicines" id="medicines" maxlength="255"/><br/>
            <input type="submit" value="Save" class="btn" />
        </form:form>

        <table>
            <thead>
                <tr>
                    <th>Patient Name</th>
                    <th>Report Date</th>
                    <th>Description</th>
                    <th>Medicines</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="report" items="${reports}">
                    <tr id="row-${report.id}" class="reportRow" data-patient-id="${report.patient.id}">
                        <td>${report.patient.name}</td>
                        <td data-original-value="${report.reportDate}">${report.reportDate}</td>
                        <td data-original-value="${report.description}">${report.description}</td>
                        <td data-original-value="${report.medicines}">${report.medicines}</td>
                        <td>
                            
                           <!-- Delete button for Report -->
<form action="${pageContext.request.contextPath}/reports/delete-report/${report.id}" method="post" style="display:inline;">
    <input type="submit" class="btn btn-delete" value="Delete" onclick="return confirm('Are you sure you want to delete this report?');"/>
</form>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
         </div>
</body>
<footer style="text-align: center; margin-top: 100px; padding: 10px; background-color: #f4f4f4;">
    <p>&copy; 2024 Sharmistha Pal. All rights reserved.</p>
</footer>
</html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="demo.healthmonitoring.entities.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reports</title>
</head>
<body>
    <h1>Reports</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Patient</th>
                <th>Date</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="report" items="${reports}">
                <tr>
                    <td>${report.id}</td>
                    <td>${report.patient.name}</td>
                    <td>${report.reportDate}</td>
                    <td>${report.description}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

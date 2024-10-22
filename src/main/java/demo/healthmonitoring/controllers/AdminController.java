package demo.healthmonitoring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @GetMapping("/admin-dashboard")
    public String showAdminDashboard() {
        return "admin-dashboard"; // Matches admin-dashboard.jsp
    }
}

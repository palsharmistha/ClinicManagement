package demo.healthmonitoring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import demo.healthmonitoring.entities.Report;
import demo.healthmonitoring.services.ReportService;

import java.util.List;

@Controller
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/reports")
    public String viewReports(Model model) {
        // Fetch the list of reports from the service
        List<Report> reports = reportService.getAllReports();
        
        // Add the list of reports to the model
        model.addAttribute("reports", reports);
        
        // Return the name of the JSP view
        return "reports";
    }
}

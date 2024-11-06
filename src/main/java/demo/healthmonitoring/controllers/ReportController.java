package demo.healthmonitoring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.healthmonitoring.entities.Patient;
import demo.healthmonitoring.entities.Report;
import demo.healthmonitoring.services.PatientService;
import demo.healthmonitoring.services.ReportService;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/reports")
public class ReportController {
    @Autowired
    private PatientService patientService;

    @Autowired
    private ReportService reportService;

    /**
     * Displays the list of reports and form to create or edit a report.
     */
    @GetMapping
    public String showReports(Model model) {
        model.addAttribute("patients", patientService.getAllPatients());
        model.addAttribute("reports", reportService.getAllReports());
        model.addAttribute("medicinesList", Arrays.asList("Medicine 1", "Medicine 2", "Medicine 3"));
        model.addAttribute("report", new Report());
        return "reports"; // Ensure this matches your JSP name
    }

    /**
     * Saves or updates a report with the associated patient.
     */
    @PostMapping("/save")
    public String saveOrUpdateReport(@ModelAttribute Report report, 
                                      @RequestParam(required = false) Long patientId,
                                      RedirectAttributes redirectAttributes) {
        try {
            if (patientId != null) {
                reportService.saveReportWithPatient(report, patientId);  // Associate with patient if provided
            } else {
                reportService.save(report); // Save as new report
            }
            redirectAttributes.addFlashAttribute("message", "Report saved successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to save report: " + e.getMessage());
        }
        return "redirect:/reports"; // Redirect after saving
    }

   
    /**
     * Handles AJAX request for updating a report via JSON for inline editing.
     */
    @PostMapping("/save/{reportId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateReport(@PathVariable Long reportId, 
                                                             @RequestBody Report updatedReport) {
        Map<String, Object> response = new HashMap<>();
        try {
            Report report = reportService.getReportById(reportId);
            if (report != null) {
                report.setReportDate(updatedReport.getReportDate());
                report.setDescription(updatedReport.getDescription());
                report.setMedicines(updatedReport.getMedicines());
                reportService.saveReportWithPatient(report, report.getPatient().getId());
                response.put("success", true);
            } else {
                response.put("success", false);
                response.put("message", "Report not found.");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }

    /**
     * Deletes a report.
     */
    @PostMapping("/delete-report/{id}")
    public String deleteReport(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        boolean isDeleted = reportService.deleteReportById(id);
        
        if (isDeleted) {
            redirectAttributes.addFlashAttribute("message", "Report deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Report not found");
        }
        
        return "redirect:/reports"; // Redirects back to the reports page
    }


}

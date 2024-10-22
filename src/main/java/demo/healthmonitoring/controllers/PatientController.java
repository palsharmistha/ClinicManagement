package demo.healthmonitoring.controllers;

import demo.healthmonitoring.entities.Patient;
import demo.healthmonitoring.services.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@Controller
public class PatientController {

    @Autowired
    private PatientService patientService;

    @GetMapping("/add-patient")
    public String showAddPatientForm(Model model) {
        model.addAttribute("patient", new Patient());
        return "add-patient";  // Matches add-patient.jsp
    }

    @PostMapping("/add-patient")
    public String addPatient(@ModelAttribute Patient patient) {
        patientService.savePatient(patient);
        return "redirect:/view-patients";  // Ensure URL is consistent with JSP
    }
    @GetMapping("/view-patients")
    public String viewPatients(Model model) {
        List<Patient> patients = patientService.getAllPatients();
        System.out.println("Patients in Model: " + patients); // Debugging line
        model.addAttribute("patients", patients);
        return "view-patients";
    }


    
    @GetMapping("/test")
    public String showTestPage() {
        return "test";  // Matches test.jsp
    }
}

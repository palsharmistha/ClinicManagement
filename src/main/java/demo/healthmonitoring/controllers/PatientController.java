package demo.healthmonitoring.controllers;

import demo.healthmonitoring.entities.Patient;
import demo.healthmonitoring.services.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        model.addAttribute("patients", patients);
        return "view-patients";
    }
    @PostMapping("/delete-patient/{id}")
    public String deletePatient(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            patientService.deletePatientById(id);
            redirectAttributes.addFlashAttribute("successMessage", "Patient deleted successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error occurred while deleting the patient.");
        }
        return "redirect:/view-patients"; // Redirects back to the patient list
    }
    // Mapping to display edit form
    @GetMapping("/edit-patient/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Patient patient = patientService.getPatientById(id);
        model.addAttribute("patient", patient);
        return "editPatient";  // Name of the JSP file for the edit form
    }

    // Mapping to handle form submission for updating patient details
    @PostMapping("/edit-patient/{id}")
    public String updatePatient(@PathVariable Long id, @ModelAttribute("patient") Patient patient, RedirectAttributes redirectAttributes) {
        try {
            patientService.updatePatient(id, patient);
            redirectAttributes.addFlashAttribute("successMessage", "Patient updated successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error occurred while updating the patient.");
        }
        return "redirect:/view-patients";
    }
}

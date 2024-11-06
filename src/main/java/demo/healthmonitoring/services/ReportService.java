package demo.healthmonitoring.services;

import demo.healthmonitoring.entities.Patient;
import demo.healthmonitoring.entities.Report;
import demo.healthmonitoring.repositories.PatientRepository;
import demo.healthmonitoring.repositories.ReportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * Service class for managing reports.
 */
@Service
public class ReportService {

    @Autowired
    private ReportRepository reportRepository;

    @Autowired
    private PatientRepository patientRepository;

    /**
     * Saves a report to the database.
     *
     * @param report The report to be saved.
     * @return The saved report.
     */
    public Report save(Report report) {
        return reportRepository.save(report);
    }

    /**
     * Saves a report with an associated patient.
     *
     * @param report    The report to be saved.
     * @param patientId The ID of the patient to associate with the report.
     * @return The saved report with the associated patient.
     * @throws PatientNotFoundException if the patient is not found.
     */
    public Report saveReportWithPatient(Report report, Long patientId) {
        Patient patient = patientRepository.findById(patientId)
                .orElseThrow(() -> new PatientNotFoundException("Patient not found with ID: " + patientId));
        report.setPatient(patient);
        return reportRepository.save(report);
    }
    
    /**
     * Retrieves a report by its ID.
     *
     * @param id The ID of the report to retrieve.
     * @return The report with the specified ID.
     * @throws ReportNotFoundException if the report is not found.
     */
    public Report getReportById(Long id) {
        return reportRepository.findById(id)
                .orElseThrow(() -> new ReportNotFoundException("Report not found with ID: " + id));
    }

    /**
     * Retrieves all reports from the database.
     *
     * @return A list of all reports.
     */
    public List<Report> getAllReports() {
        return reportRepository.findAll();
    }

    public boolean deleteReportById(Long id) {
        if (reportRepository.existsById(id)) {
            reportRepository.deleteById(id);
            return true;
        } else {
            return false;
        }
    }

// Custom exceptions for better error handling
class PatientNotFoundException extends RuntimeException {
    public PatientNotFoundException(String message) {
        super(message);
    }
}

class ReportNotFoundException extends RuntimeException {
    public ReportNotFoundException(String message) {
        super(message);
    }
}}

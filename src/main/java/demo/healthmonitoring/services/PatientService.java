package demo.healthmonitoring.services;

import demo.healthmonitoring.entities.Patient;
import demo.healthmonitoring.entities.Report;
import demo.healthmonitoring.repositories.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientService {

	/**
     * Retrieves all patients from the database.
     *
     * @return A list of all patients.
     */
    public List<Patient> findAll() {
        return patientRepository.findAll();
    }

    /**
     * Finds a patient by ID.
     *
     * @param id The ID of the patient to retrieve.
     * @return The patient with the specified ID.
     * @throws RuntimeException if the patient is not found.
     */
    public Patient findById(Long id) {
        return patientRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Patient not found with ID: " + id));
    }
    @Autowired
    private PatientRepository patientRepository;

    /**
     * Saves a patient to the database.
     * 
     * @param patient The patient to be saved.
     */
    public void savePatient(Patient patient) {
        patientRepository.save(patient);
    }

    /**
     * Retrieves all patients from the database.
     * 
     * @return A list of all patients.
     */
    public List<Patient> getAllPatients() {
        List<Patient> patients = patientRepository.findAll();
        System.out.println("Retrieved Patients: " + patients); // Debugging line to check if patients are fetched
        return patients;
    }
    

    /**
     * Retrieves a patient by its ID.
     * 
     * @param id The ID of the patient to retrieve.
     * @return The patient with the specified ID, or null if not found.
     */
    public Patient getPatientById(Long id) {
        return patientRepository.findById(id).orElse(null);
    }

    /**
     * Deletes a patient by its ID.
     * 
     * @param id The ID of the patient to delete.
     */
    public void deletePatientById(Long id) {
        // Ensure that the patient exists before deleting (optional)
        if (patientRepository.existsById(id)) {
            patientRepository.deleteById(id);
        } else {
            throw new RuntimeException("Patient not found with id: " + id); // Handle accordingly
        }
    }
    // Method to update a patient's details
    public void updatePatient(Long id, Patient updatedPatient) {
        Patient patient = getPatientById(id);
        if (patient != null) {
            patient.setName(updatedPatient.getName());
            patient.setAge(updatedPatient.getAge());
            patient.setHealthIssue(updatedPatient.getHealthIssue());
            patient.setDateOfVisit(updatedPatient.getDateOfVisit());
            patientRepository.save(patient);
        }
    } 
   
}

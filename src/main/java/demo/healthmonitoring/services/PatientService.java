package demo.healthmonitoring.services;

import demo.healthmonitoring.entities.Patient;
import demo.healthmonitoring.repositories.PatientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientService {

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
    public void deletePatient(Long id) {
        patientRepository.deleteById(id);
    }
}

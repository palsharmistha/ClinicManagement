package demo.healthmonitoring.repositories;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import demo.healthmonitoring.entities.Report;

@Repository
public interface ReportRepository extends JpaRepository<Report, Long> {
}
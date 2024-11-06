package demo.healthmonitoring.repositories;

import demo.healthmonitoring.entities.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ReportRepository extends JpaRepository<Report, Long> {
   
}

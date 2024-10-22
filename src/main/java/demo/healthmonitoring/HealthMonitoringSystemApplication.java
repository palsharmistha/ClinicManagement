package demo.healthmonitoring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.thymeleaf.ThymeleafAutoConfiguration;
@SpringBootApplication(exclude = {ThymeleafAutoConfiguration.class})
public class HealthMonitoringSystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(HealthMonitoringSystemApplication.class, args);
    }
}


package com.example.employee.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.employee.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    List<Employee> findByRole(String role);

    Optional<Employee> findByEmail(String email);  // Add this method to find by email

    List<Employee> findByNameContainingIgnoreCase(String name);
    
 // Filter employees by department
    List<Employee> findByDepartment(String department);

    // Filter employees by position
    List<Employee> findByPosition(String position);
    
    List<Employee> findByCity(String city); 
    
 // Filter by a specific salary
    List<Employee> findBySalary(Double salary);

    // Filter by salary range
    List<Employee> findBySalaryBetween(Double minSalary, Double maxSalary);
    
    List<Employee> findByEmployeeId(String employeeId);  // Specific Employee ID

    List<Employee> findByEmployeeIdBetween(String minId, String maxId);
    
}


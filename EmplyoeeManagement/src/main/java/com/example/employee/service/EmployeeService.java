package com.example.employee.service;

import com.example.employee.model.Employee;
import com.example.employee.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    // Login method to find employee by email and validate password
    public Employee login(String email, String password) {
        Optional<Employee> optionalEmployee = employeeRepository.findByEmail(email);
        if (optionalEmployee.isPresent()) {
            Employee employee = optionalEmployee.get();
            // Compare the provided password with the stored password (in a real-world application, consider password encryption)
            if (employee.getPassword().equals(password)) {
                return employee;  // Return the employee if passwords match
            }
        }
        return null;  // Return null if employee is not found or password doesn't match
    }

    // Save employee with generated employee ID
    public Employee save(Employee employee) {
        if (employee.getEmployeeId() == null || employee.getEmployeeId().isEmpty()) {
            String employeeId = generateEmployeeIdByRole(employee.getRole());
            employee.setEmployeeId(employeeId);
        }
        return employeeRepository.save(employee);
    }

    // Generate a 6-digit employee ID based on role
    private String generateEmployeeIdByRole(String role) {
        List<Employee> employeesByRole = employeeRepository.findByRole(role);
        int count = employeesByRole.size() + 1;
        String prefix;
        switch (role.toUpperCase()) {
            case "ADMIN":
                prefix = "1";
                break;
            case "MANAGER":
                prefix = "2";
                break;
            case "EMPLOYEE":
                prefix = "3";
                break;
            default:
                throw new IllegalArgumentException("Unknown role: " + role);
        }
        return String.format("%s%05d", prefix, count);  // Format: prefix followed by 5 digits
    }

    // Find an employee by ID
    public Employee findById(Long id) {
        return employeeRepository.findById(id).orElse(null);
    }

    // Find all employees
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    // Search employees by name
    public List<Employee> searchByName(String name) {
        return employeeRepository.findByNameContainingIgnoreCase(name);
    }

    // Delete an employee by ID with proper checks and logging
    public void deleteById(Long id) {
        Optional<Employee> employee = employeeRepository.findById(id);
        if (employee.isPresent()) {
            employeeRepository.deleteById(id);
        } else {
            throw new IllegalArgumentException("Employee with ID " + id + " not found.");
        }
    }

    // Find all employees by role
    public List<Employee> findByRole(String role) {
        return employeeRepository.findByRole(role);
    }

    // Find all employees excluding managers and admins
    public List<Employee> findAllEmployees() {
        return employeeRepository.findByRole("EMPLOYEE");
    }

    // Find all managers
    public List<Employee> findAllManagers() {
        return employeeRepository.findByRole("MANAGER");
    }

    // Find all admins
    public List<Employee> findAllAdmins() {
        return employeeRepository.findByRole("ADMIN");
    }
    
 // Filter by department
    public List<Employee> filterByDepartment(String department) {
        return employeeRepository.findByDepartment(department);
    }

    // Filter by position
    public List<Employee> filterByPosition(String position) {
        return employeeRepository.findByPosition(position);
    }
    
 // Filter by city
    public List<Employee> filterByCity(String city) {
        return employeeRepository.findByCity(city);
    }

    // Filter by email
    public List<Employee> filterByEmail(String email) {
        return employeeRepository.findByEmail(email).map(List::of).orElse(List.of());
    }

    // Filter by name
    public List<Employee> filterByName(String name) {
        return employeeRepository.findByNameContainingIgnoreCase(name);
    }
    
 // Filter by a specific salary
    public List<Employee> filterBySalary(Double salary) {
        return employeeRepository.findBySalary(salary);
    }

    // Filter by salary range
    public List<Employee> filterBySalaryRange(Double minSalary, Double maxSalary) {
        return employeeRepository.findBySalaryBetween(minSalary, maxSalary);
    }
    
    /// Filter by a specific Employee ID
    public List<Employee> filterByEmployeeId(String employeeId) {
        return employeeRepository.findByEmployeeId(employeeId);
    }

    // Filter by Employee ID range (String)
    public List<Employee> filterByEmployeeIdRange(String minId, String maxId) {
        return employeeRepository.findByEmployeeIdBetween(minId, maxId);
    }
    
 // Method to filter by role
    public List<Employee> filterByRole(String role) {
        return employeeRepository.findByRole(role);
    }
    
}

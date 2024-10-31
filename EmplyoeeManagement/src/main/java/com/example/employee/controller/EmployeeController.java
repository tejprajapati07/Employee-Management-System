package com.example.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.employee.model.Employee;
import com.example.employee.service.EmployeeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    // Home page
    @GetMapping("/")
    public String home() {
        return "home";
    }

    // Show registration form
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("employee", new Employee());
        return "register";
    }

    // Handle registration
    @PostMapping("/register")
    public String register(@ModelAttribute Employee employee, Model model) {
        employeeService.save(employee);  // Generate ID and save employee
        model.addAttribute("message", "Registration successful!");
        return "login";
    }

    // Show login form
    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    // Handle login
    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
        Employee employee = employeeService.login(email, password);
        if (employee == null) {
            model.addAttribute("message", "Invalid credentials");
            return "login";
        }

        session.setAttribute("employee", employee);
        session.setAttribute("role", employee.getRole());

        // Redirect based on role
        switch (employee.getRole()) {
            case "ADMIN":
                return "redirect:/admin";
            case "MANAGER":
                return "redirect:/manager";
            case "EMPLOYEE":
                return "redirect:/employee";
            default:
                return "login";
        }
    }

    // Admin Dashboard - Full CRUD
    @GetMapping("/admin")
    public String adminDashboard(Model model) {
        List<Employee> employees = employeeService.findAll();
        model.addAttribute("employees", employees);
        return "admin_dashboard";
    }

    // Create a new employee (for Admin and Manager)
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("employee", new Employee());
        return "create_employee";
    }

    @PostMapping("/create")
    public String createEmployee(@ModelAttribute Employee employee) {
        employeeService.save(employee);
        return "redirect:/admin";
    }

    // Edit employee details
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model, HttpSession session) {
        Employee employee = employeeService.findById(id);
        if (employee != null) {
            String role = (String) session.getAttribute("role");

            // Check if the logged-in user is an admin or manager
            if ("MANAGER".equals(role)) {
                model.addAttribute("employee", employee);
                return "edit_employee_manager";  // Return manager-specific JSP
            } else if ("ADMIN".equals(role)) {
                model.addAttribute("employee", employee);
                return "edit_employee";  // Return admin JSP
            }
        }
        return "redirect:/error";
    }

    @PostMapping("/edit")
    public String editEmployee(@ModelAttribute Employee employee, HttpSession session) {
        String role = (String) session.getAttribute("role");

        if ("MANAGER".equals(role) || "ADMIN".equals(role)) {
            employeeService.save(employee);
        }

        // Redirect based on the role of the logged-in user
        if ("MANAGER".equals(role)) {
            return "redirect:/manager";
        } else {
            return "redirect:/admin";
        }
    }

    // Delete employee - Only Admin can delete
    @PostMapping("/delete/{id}")
    public String deleteEmployee(@PathVariable Long id, HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");

        if ("ADMIN".equals(role)) {
            try {
                employeeService.deleteById(id);
                model.addAttribute("message", "Employee deleted successfully!");
            } catch (IllegalArgumentException e) {
                model.addAttribute("error", e.getMessage());
                return "error";
            }
        } else {
            return "redirect:/accessDenied";  // Redirect if not authorized
        }

        return "redirect:/admin";
    }

    // View All Admins
    @GetMapping("/viewAdmins")
    public String viewAdmins(Model model) {
        List<Employee> admins = employeeService.findByRole("ADMIN");
        model.addAttribute("employees", admins);
        return "view_admins";
    }

    // View All Managers
    @GetMapping("/viewManagers")
    public String viewManagers(Model model) {
        List<Employee> managers = employeeService.findByRole("MANAGER");
        model.addAttribute("employees", managers);
        return "view_managers";
    }

    // View All Employees
    @GetMapping("/viewEmployees")
    public String viewEmployees(Model model) {
        List<Employee> employees = employeeService.findByRole("EMPLOYEE");
        model.addAttribute("employees", employees);
        return "view_employees";
    }

    // Logout Functionality
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();  // Invalidate the session
        return "redirect:/login";  // Redirect to login page
    }

    // Manager Dashboard - Create and Edit Only
    @GetMapping("/manager")
    public String managerDashboard(Model model) {
        List<Employee> employees = employeeService.findAll();
        model.addAttribute("employees", employees);
        return "manager_dashboard";
    }

    // Employee Dashboard - View profile
    @GetMapping("/profile")
    public String viewProfile(HttpSession session, Model model) {
        Employee employee = (Employee) session.getAttribute("employee");
        model.addAttribute("employee", employee);
        return "employee_dashboard";
    }

    // Employee Dashboard - Only view own profile
    @GetMapping("/employee")
    public String employeeDashboard(HttpSession session, Model model) {
        Employee employee = (Employee) session.getAttribute("employee");
        if (employee != null) {
            model.addAttribute("employee", employee);
            return "employee_dashboard";
        } else {
            return "redirect:/login";
        }
    }

    // Create Employee for Manager (Role is always set to EMPLOYEE)
    @GetMapping("/createEmployee")
    public String showCreateEmployeeForm(Model model) {
        Employee employee = new Employee();
        model.addAttribute("employee", employee);
        return "create_employee_manager";
    }

    @PostMapping("/createEmployee")
    public String createEmployee(@ModelAttribute Employee employee, HttpSession session, Model model) {
        employee.setRole("EMPLOYEE"); // Ensure role is always set to EMPLOYEE
        employeeService.save(employee);
        model.addAttribute("message", "Employee created successfully!");

        // Check the role of the currently logged-in user
        String currentRole = (String) session.getAttribute("role");

        if ("MANAGER".equals(currentRole)) {
            return "redirect:/manager"; // Redirect to manager dashboard
        } else {
            return "redirect:/admin"; // Redirect to admin dashboard
        }
    }

    // Manager view of employees (read-only)
    @GetMapping("/manager/employees")
    public String viewEmployees1(Model model) {
        List<Employee> employees = employeeService.findAllEmployees(); // Only employees, no managers
        model.addAttribute("employees", employees);
        return "view_employees_manager"; // A specific JSP for this view
    }

    // View all managers for Manager (read-only)
    @GetMapping("/manager/viewManagers")
    public String viewManagersForManager(Model model) {
        List<Employee> managers = employeeService.findAllManagers(); // Fetch only managers
        model.addAttribute("employees", managers);
        return "view_managers_manager"; // A specific JSP for viewing managers (no edit/delete)
    }

    // Search functionality for Admin and Manager
    @GetMapping("/search")
    public String search(@RequestParam("name") String name, Model model, HttpSession session) {
        String role = (String) session.getAttribute("role");
        if ("MANAGER".equals(role) || "ADMIN".equals(role)) {
            List<Employee> employees = employeeService.searchByName(name);
            model.addAttribute("employees", employees);
            return "search_results";
        } else {
            return "redirect:/accessDenied";
        }
    }
    
 // Show filter form
    @GetMapping("/filter")
    public String showFilterForm() {
        return "filter_employee";
    }

    // Handle filter form submission
    @PostMapping("/filter")
    public String filterEmployees(@RequestParam("filterBy") String filterBy, 
                                  @RequestParam(name = "value", required = false) String value, 
                                  @RequestParam(name = "minSalary", required = false) Double minSalary,
                                  @RequestParam(name = "maxSalary", required = false) Double maxSalary,
                                  @RequestParam(name = "minId", required = false) String minId,
                                  @RequestParam(name = "maxId", required = false) String maxId,
                                  Model model) {
        List<Employee> filteredEmployees = List.of();  // Initialize an empty list

        // Check the filterBy parameter and apply the appropriate filter
        switch (filterBy) {
            case "department":
                filteredEmployees = employeeService.filterByDepartment(value);
                break;
            case "position":
                filteredEmployees = employeeService.filterByPosition(value);
                break;
            case "city":
                filteredEmployees = employeeService.filterByCity(value);
                break;
            case "email":
                filteredEmployees = employeeService.filterByEmail(value);
                break;
            case "name":
                filteredEmployees = employeeService.filterByName(value);
                break;
            case "salary":
                // Handle salary filtering (range or specific salary)
                if (minSalary != null && maxSalary != null) {
                    filteredEmployees = employeeService.filterBySalaryRange(minSalary, maxSalary);
                } else if (minSalary != null) {
                    filteredEmployees = employeeService.filterBySalary(minSalary);
                }
                break;
            case "employeeId":
                // Handle Employee ID filtering (range or specific ID)
                if (minId != null && !minId.isEmpty()) {
                    if (maxId != null && !maxId.isEmpty()) {
                        filteredEmployees = employeeService.filterByEmployeeIdRange(minId, maxId);
                    } else {
                        filteredEmployees = employeeService.filterByEmployeeId(minId);
                    }
                }
                break;

            // Add the case for role filtering
            case "role":
                filteredEmployees = employeeService.filterByRole(value);
                break;

            default:
                break;
        }

        model.addAttribute("employees", filteredEmployees);
        return "filtered_employees";  // Render the results in the JSP page
    }
    
 // Show filter form for Manager Dashboard
    @GetMapping("/manager/filter")
    public String showManagerFilterForm() {
        return "filter_employee_manager";
    }

    // Handle filter form submission for Manager Dashboard
    @PostMapping("/manager/filter")
    public String filterEmployeesForManager(@RequestParam("filterBy") String filterBy, 
                                            @RequestParam(name = "value", required = false) String value, 
                                            @RequestParam(name = "minSalary", required = false) Double minSalary,
                                            @RequestParam(name = "maxSalary", required = false) Double maxSalary,
                                            @RequestParam(name = "minId", required = false) String minId,
                                            @RequestParam(name = "maxId", required = false) String maxId,
                                            Model model) {
        List<Employee> filteredEmployees = List.of();  // Initialize an empty list

        // Check the filterBy parameter and apply the appropriate filter
        switch (filterBy) {
            case "department":
                filteredEmployees = employeeService.filterByDepartment(value);
                break;
            case "position":
                filteredEmployees = employeeService.filterByPosition(value);
                break;
            case "city":
                filteredEmployees = employeeService.filterByCity(value);
                break;
            case "email":
                filteredEmployees = employeeService.filterByEmail(value);
                break;
            case "name":
                filteredEmployees = employeeService.filterByName(value);
                break;
            case "salary":
                // Handle salary filtering (range or specific salary)
                if (minSalary != null && maxSalary != null) {
                    filteredEmployees = employeeService.filterBySalaryRange(minSalary, maxSalary);
                } else if (minSalary != null) {
                    filteredEmployees = employeeService.filterBySalary(minSalary);
                }
                break;
            case "employeeId":
                // Handle Employee ID filtering (range or specific ID)
                if (minId != null && !minId.isEmpty()) {
                    if (maxId != null && !maxId.isEmpty()) {
                        filteredEmployees = employeeService.filterByEmployeeIdRange(minId, maxId);
                    } else {
                        filteredEmployees = employeeService.filterByEmployeeId(minId);
                    }
                }
                break;

            case "role":
                filteredEmployees = employeeService.filterByRole(value);
                break;

            default:
                break;
        }

        model.addAttribute("employees", filteredEmployees);
        return "filtered_employees_manager";  // Render the manager results in the JSP page
    }
    
    
    // Access Denied page
    @GetMapping("/accessDenied")
    public String accessDenied() {
        return "accessDenied";
    }
}

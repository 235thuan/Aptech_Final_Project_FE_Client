package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import com.example.demo.dto.StudentDTO;
import com.example.demo.dto.CourseDTO;
import com.example.demo.dto.GradeDTO;
import com.example.demo.services.StudentService;
import com.example.demo.security.UserPrincipal;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/students")
@Slf4j
public class StudentController {
    private final StudentService studentService;
    
    @Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }
    
    @GetMapping("/profile")
    public ResponseEntity<StudentDTO> getProfile(@AuthenticationPrincipal UserPrincipal currentUser) {
        StudentDTO profile = studentService.getProfile(currentUser.getId());
        return ResponseEntity.ok(profile);
    }
    
    @GetMapping("/courses")
    public ResponseEntity<List<CourseDTO>> getEnrolledCourses(@AuthenticationPrincipal UserPrincipal currentUser) {
        List<CourseDTO> courses = studentService.getEnrolledCourses(currentUser.getId());
        return ResponseEntity.ok(courses);
    }
    
    @GetMapping("/grades")
    public ResponseEntity<List<GradeDTO>> getGrades(@AuthenticationPrincipal UserPrincipal currentUser) {
        List<GradeDTO> grades = studentService.getGrades(currentUser.getId());
        return ResponseEntity.ok(grades);
    }
} 
package com.example.demo.services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import com.example.demo.repositories.StudentRepository;
import com.example.demo.repositories.CourseRepository;
import com.example.demo.repositories.GradeRepository;
import com.example.demo.dto.StudentDTO;
import com.example.demo.dto.CourseDTO;
import com.example.demo.dto.GradeDTO;
import com.example.demo.exceptions.ResourceNotFoundException;
import com.example.demo.models.Student;
import com.example.demo.models.Course;
import com.example.demo.models.Grade;

@Service
@Slf4j
public class StudentService {
    private final StudentRepository studentRepository;
    private final CourseRepository courseRepository;
    private final GradeRepository gradeRepository;
    
    @Autowired
    public StudentService(StudentRepository studentRepository, 
                         CourseRepository courseRepository,
                         GradeRepository gradeRepository) {
        this.studentRepository = studentRepository;
        this.courseRepository = courseRepository;
        this.gradeRepository = gradeRepository;
    }
    
    public StudentDTO getProfile(Long studentId) {
        return studentRepository.findById(studentId)
            .map(this::mapToDTO)
            .orElseThrow(() -> new ResourceNotFoundException("Student not found"));
    }
    
    public List<CourseDTO> getEnrolledCourses(Long studentId) {
        return courseRepository.findByStudentId(studentId)
            .stream()
            .map(this::mapToDTO)
            .collect(Collectors.toList());
    }
    
    public List<GradeDTO> getGrades(Long studentId) {
        return gradeRepository.findByStudentId(studentId)
            .stream()
            .map(this::mapToDTO)
            .collect(Collectors.toList());
    }

    private StudentDTO mapToDTO(Student student) {
        return new StudentDTO(
            student.getId(),
            student.getUser().getName(),
            student.getUser().getEmail(),
            student.getMajor().getName(),
            student.getTuitionStatus()
        );
    }

    private CourseDTO mapToDTO(Course course) {
        return new CourseDTO(
            course.getId(),
            course.getName(),
            course.getMajor().getName(),
            course.getType(),
            course.getClasses().isEmpty() ? null : 
                course.getClasses().get(0).getTeacher().getUser().getName()
        );
    }

    private GradeDTO mapToDTO(Grade grade) {
        return new GradeDTO(
            grade.getId(),
            grade.getClassEntity().getCourse().getName(),
            grade.getStudent().getUser().getName(),
            grade.getScore()
        );
    }
} 
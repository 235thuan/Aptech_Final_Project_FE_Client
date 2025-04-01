package com.example.demo.models;

import com.example.demo.models.enums.TuitionStatus;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Entity
@Table(name = "students")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
    
    @Column(name = "student_code", unique = true)
    private String studentCode;
    
    @ManyToOne
    @JoinColumn(name = "major_id")
    private Major major;
    
    @Enumerated(EnumType.STRING)
    private TuitionStatus tuitionStatus;
    
    @OneToMany(mappedBy = "student")
    private List<Enrollment> enrollments;
    
    @OneToMany(mappedBy = "student")
    private List<Grade> grades;
    
    @OneToMany(mappedBy = "student")
    private List<Attendance> attendances;
    
    // Getters, setters, constructors
} 
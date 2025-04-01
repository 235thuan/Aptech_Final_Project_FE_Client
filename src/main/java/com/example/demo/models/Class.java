package com.example.demo.models;

import javax.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.util.List;

@Entity
@Table(name = "classes")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Class {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;
    
    @ManyToOne
    @JoinColumn(name = "teacher_id")
    private Teacher teacher;
    
    @OneToMany(mappedBy = "classEntity")
    private List<Enrollment> enrollments;
    
    @OneToMany(mappedBy = "classEntity")
    private List<Material> materials;
    
    @OneToMany(mappedBy = "classEntity")
    private List<Grade> grades;
    
    @OneToMany(mappedBy = "classEntity")
    private List<Attendance> attendances;
} 
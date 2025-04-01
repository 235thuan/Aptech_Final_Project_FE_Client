package com.example.demo.models;

import javax.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.util.List;
import com.example.demo.models.Major;
import com.example.demo.models.Class;
import com.example.demo.models.enums.CourseType;

@Entity
@Table(name = "courses")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String name;
    
    @Column(columnDefinition = "TEXT")
    private String description;
    
    @Column(name = "credit_hours")
    private Integer creditHours;
    
    @ManyToOne
    @JoinColumn(name = "major_id")
    private Major major;
    
    @Enumerated(EnumType.STRING)
    private CourseType type;
    
    @OneToMany(mappedBy = "course")
    private List<Class> classes;
} 
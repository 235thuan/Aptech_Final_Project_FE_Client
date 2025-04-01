package com.example.demo.models;

import javax.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.util.List;
import com.example.demo.models.Course;
import com.example.demo.models.Student;

@Entity
@Table(name = "majors")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Major {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String name;
    
    @OneToMany(mappedBy = "major")
    private List<Course> courses;
    
    @OneToMany(mappedBy = "major")
    private List<Student> students;
} 
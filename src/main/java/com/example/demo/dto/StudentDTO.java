package com.example.demo.dto;

import com.example.demo.models.enums.TuitionStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudentDTO {
    private Long id;
    private String name;
    private String email;
    private String majorName;
    private TuitionStatus tuitionStatus;
} 
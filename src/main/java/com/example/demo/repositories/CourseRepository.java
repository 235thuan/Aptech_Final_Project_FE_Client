package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import com.example.demo.models.Course;
import com.example.demo.models.enums.CourseType;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {
    @Query("SELECT DISTINCT c FROM Course c JOIN c.classes cl JOIN cl.enrollments e WHERE e.student.id = :studentId")
    List<Course> findByStudentId(@Param("studentId") Long studentId);
    
    List<Course> findByMajorId(Long majorId);
    
    @Query("SELECT c FROM Course c WHERE c.type = :type")
    List<Course> findByType(@Param("type") CourseType type);
} 
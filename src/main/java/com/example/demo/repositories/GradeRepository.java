package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import com.example.demo.models.Grade;

@Repository
public interface GradeRepository extends JpaRepository<Grade, Long> {
    List<Grade> findByStudentId(Long studentId);
    List<Grade> findByClassEntityId(Long classId);
    
    @Query("SELECT AVG(g.score) FROM Grade g WHERE g.student.id = :studentId")
    Double getAverageScoreByStudentId(@Param("studentId") Long studentId);

    List<Grade> findByStudentIdAndClassEntityId(Long studentId, Long classId);
} 
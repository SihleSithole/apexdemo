package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Tutor;

public interface TutorRepository extends JpaRepository<Tutor, String>{

}
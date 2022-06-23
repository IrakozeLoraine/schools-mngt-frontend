package com.example.schools_mngt.models;


import com.example.schools_mngt.enums.Degree;
import com.fasterxml.jackson.annotation.JsonProperty;

public class TeacherEntry {
    private String names;
    private Degree degree;

    @JsonProperty("school_id")
    private String schoolId;

    public TeacherEntry(String names, Degree degree, String schoolId) {
        this.names = names;
        this.degree = degree;
        this.schoolId = schoolId;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public Degree getDegree() {
        return degree;
    }

    public void setDegree(Degree degree) {
        this.degree = degree;
    }

    public String getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(String schoolId) {
        this.schoolId = schoolId;
    }
}

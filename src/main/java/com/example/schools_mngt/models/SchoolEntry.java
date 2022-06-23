package com.example.schools_mngt.models;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SchoolEntry {
    private Long id;

    private String name;
    private String motto;
    @JsonProperty("established_on")
    private String establishedOn;

    public SchoolEntry(String name, String motto, String establishedOn) {
        this.name = name;
        this.motto = motto;
        this.establishedOn = establishedOn;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMotto() {
        return motto;
    }

    public void setMotto(String motto) {
        this.motto = motto;
    }

    public String getEstablishedOn() {
        return establishedOn;
    }

    public void setEstablishedOn(String establishedOn) {
        this.establishedOn = establishedOn;
    }
}

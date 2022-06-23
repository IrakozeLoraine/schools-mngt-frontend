package com.example.schools_mngt.resources;

import com.example.schools_mngt.enums.Degree;
import com.example.schools_mngt.models.ResponseDAO;
import com.example.schools_mngt.models.SchoolEntry;
import com.example.schools_mngt.models.TeacherEntry;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;

@Controller
@RequestMapping()
public class SchoolResource {

    private static String url = "http://localhost:8082/api/v1";

    @GetMapping()
    public String dashboardPage(Model model){
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<ResponseDAO> responseEntity = restTemplate.getForEntity(url+"/schools", ResponseDAO.class);

        model.addAttribute("schools", responseEntity.getBody().getData());

        return "dashboard";
    }

    @GetMapping("/schools")
    public String schoolsPage(Model model){
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<ResponseDAO> responseEntity = restTemplate.getForEntity(url+"/schools", ResponseDAO.class);

        model.addAttribute("schools", responseEntity.getBody().getData());

        return "dashboard";
    }

    @GetMapping("/teachers")
    public String teachersPage(Model model){
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<ResponseDAO> responseEntity = restTemplate.getForEntity(url+"/teachers", ResponseDAO.class);

        model.addAttribute("teachers", responseEntity.getBody().getData());

        return "teachers";
    }

    @GetMapping("/login")
    public String loginPage(){
        return "login";
    }

    @GetMapping("/logout")
    public String logoutPage(){
        return "redirect:/login";
    }

    @GetMapping("/new-school")
    public String newSchoolPage(){
        return "newSchool";
    }

    @PostMapping("/save-school")
    public String saveSchool(String name, String school_motto, String established_on, Model model){
        RestTemplate restTemplate = new RestTemplate();
        SchoolEntry schoolEntry = new SchoolEntry(name, school_motto, established_on);
        ResponseEntity<ResponseDAO> responseEntity = restTemplate.postForEntity(url, schoolEntry, ResponseDAO.class);

        model.addAttribute("school", responseEntity.getBody().getData());

        return "redirect:/";
    }

    @GetMapping("/new-teacher")
    public String newTeacherPage(Model model){
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<ResponseDAO> responseEntity = restTemplate.getForEntity(url+"/schools", ResponseDAO.class);

        model.addAttribute("schools", responseEntity.getBody().getData());

        List<Degree> degrees = Arrays.asList(Degree.values());

        model.addAttribute("degrees", degrees);

        return "newTeacher";
    }

    @PostMapping("/save-teacher")
    public String saveTeacher(String name, Degree degree, String school_id, Model model){
        RestTemplate restTemplate = new RestTemplate();
        TeacherEntry teacherEntry = new TeacherEntry(name, degree, school_id);
        ResponseEntity<ResponseDAO> responseEntity = restTemplate.postForEntity(url+"/teachers", teacherEntry, ResponseDAO.class);

        model.addAttribute("teacher", responseEntity.getBody().getData());

        return "redirect:/teachers";
    }
}

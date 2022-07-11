package com.example.schools_mngt.resources;

import com.example.schools_mngt.DAO.LoginDTO;
import com.example.schools_mngt.DAO.UserDAO;
import com.example.schools_mngt.enums.Degree;
import com.example.schools_mngt.DAO.ResponseDTO;
import com.example.schools_mngt.enums.ERole;
import com.example.schools_mngt.models.SchoolEntry;
import com.example.schools_mngt.models.TeacherEntry;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/")
public class SchoolResource {

    private static String url = "http://localhost:8082/api/v1";

    @GetMapping()
    public String dashboardPage(Model model, HttpServletRequest request){
        return getSchool(model, request);
    }

    @GetMapping("schools")
    public String schoolsPage(Model model, HttpServletRequest request){
        return getSchool(model, request);
    }

    private String getSchool(Model model, HttpServletRequest request) {
        Object token = request.getSession().getAttribute("token");

        if (token!=null) {
            HttpHeaders headers = getHeaders();
            headers.set("Authorization",token.toString());
            HttpEntity<String> entity = new HttpEntity<String>(headers);

            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<ResponseDTO> responseEntity = restTemplate.exchange(url+"/schools", HttpMethod.GET, entity, ResponseDTO.class);

            model.addAttribute("schools", responseEntity.getBody().getData());
            return "dashboard";
        } else {
            return  "redirect:/login";
        }

    }

    @GetMapping("teachers")
    public String teachersPage(Model model){
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<ResponseDTO> responseEntity = restTemplate.getForEntity(url+"/teachers", ResponseDTO.class);

        model.addAttribute("teachers", responseEntity.getBody().getData());

        return "teachers";
    }

    @GetMapping("login")
    public String loginPage(){
        return "login";
    }

    @GetMapping("logout")
    public String logoutPage(){
        return "redirect:/login";
    }

    @GetMapping("new-school")
    public String newSchoolPage(){
        return "newSchool";
    }

    @PostMapping("save-school")
    public String saveSchool(HttpServletRequest request, Model model){
        Object token = request.getSession().getAttribute("token");

        if (token!=null) {
            HttpHeaders headers = getHeaders();
            headers.set("Authorization",token.toString());
            HttpEntity<String> entity = new HttpEntity<String>(headers);

            String name = request.getParameter("name");
            String school_motto = request.getParameter("school_motto");
            String established_on = request.getParameter("established_on");

            RestTemplate restTemplate = new RestTemplate();
            SchoolEntry schoolEntry = new SchoolEntry(name, school_motto, established_on);
            ResponseEntity<ResponseDTO> responseEntity = restTemplate.postForEntity(url+"schools", schoolEntry, ResponseDTO.class);

            model.addAttribute("school", responseEntity.getBody().getData());

            return "redirect:/";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("new-teacher")
    public String newTeacherPage(Model model){
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<ResponseDTO> responseEntity = restTemplate.getForEntity(url+"/schools", ResponseDTO.class);

        model.addAttribute("schools", responseEntity.getBody().getData());

        List<Degree> degrees = Arrays.asList(Degree.values());

        model.addAttribute("degrees", degrees);

        return "newTeacher";
    }

    @PostMapping("save-teacher")
    public String saveTeacher(String name, Degree degree, String school_id, Model model){
        RestTemplate restTemplate = new RestTemplate();
        TeacherEntry teacherEntry = new TeacherEntry(name, degree, school_id);
        ResponseEntity<ResponseDTO> responseEntity = restTemplate.postForEntity(url+"/teachers", teacherEntry, ResponseDTO.class);

        model.addAttribute("teacher", responseEntity.getBody().getData());

        return "redirect:/teachers";
    }

    @PostMapping("login")
    public String login(HttpServletRequest request, Model model, HttpSession session){
        String username = request.getParameter("email");
        String password = request.getParameter("password");

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.postForEntity(url+"/users/login",new LoginDTO(username,password),String.class);

        String token = "Bearer "+responseEntity.getBody();
        request.getSession().setAttribute("token",token);
        HttpHeaders headers =  new HttpHeaders();
        headers.set("Authorization",token);
        HttpEntity<String> entity = new HttpEntity<String>(headers);

        return "redirect:/";
    }

    @PostMapping("register")
    public String register(String firstName, String lastName, String email, String phone, String password, String username, ERole role){
        UserDAO dto = new UserDAO(firstName, lastName, email, phone, password, username,role);
        System.out.println("user name "+username+"  dto "+dto.getUsername()+" role "+dto.getRole());
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<ResponseDTO> responseEntity = restTemplate.postForEntity(url+"/users/add",dto, ResponseDTO.class);

        return "redirect:/login";
    }

//    @PostMapping("/edit")
//    public String updateUser(String firstName, String lastName, String email, String phone, String password, String username, Long id,ERole role, Model model, HttpServletRequest request){
//        UserDto dto = new UserDto(firstName, lastName, email, phone, password, username,role);
//        RestTemplate restTemplate = new RestTemplate();
//        restTemplate.put(url+"/users/{id}",dto,request.getParameter("id"));
//        return "redirect:/teachers";
//    }

    private HttpHeaders getHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", MediaType.APPLICATION_JSON_VALUE);
        headers.set("Accept", MediaType.APPLICATION_JSON_VALUE);
        return headers;
    }
}

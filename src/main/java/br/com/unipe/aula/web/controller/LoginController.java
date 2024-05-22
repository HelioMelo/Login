package br.com.unipe.aula.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.unipe.aula.dao.CadastroDAO;
import br.com.unipe.aula.model.Cadastro;

@Controller
public class LoginController {

    @Autowired
    private CadastroDAO cadastroDAO;

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, RedirectAttributes redirectAttributes) {
     
        Cadastro usuario = cadastroDAO.findByUsuario(username);
        
        
        if (usuario != null && usuario.getSenha().equals(password)) {
            return "redirect:/formulario"; 
        } else {
            redirectAttributes.addFlashAttribute("error", "Senha incorreta"); 
            return "redirect:/index.jsp";
        }
    }
}

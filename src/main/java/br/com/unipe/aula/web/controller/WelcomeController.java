package br.com.unipe.aula.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.unipe.aula.dao.CadastroDAO;
import br.com.unipe.aula.dao.TorcedorDAO;
import br.com.unipe.aula.model.Cadastro;
import br.com.unipe.aula.model.Torcedor;

@Controller
public class WelcomeController {
	
	@Autowired
	private TorcedorDAO dao;
	
	@Autowired
	private CadastroDAO CadastroDAO;
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String mostrarPaginaLogin() {
	    return "welcome"; 
	}
	
	@RequestMapping(value = "/rota", method = RequestMethod.GET)
	public String teste() {
		return "viewteste";
	}
	
	
	@RequestMapping(value = "/formulario", method = RequestMethod.GET)
	public ModelAndView carregarTorcedores(Model model) {
	    ModelAndView view = new ModelAndView("formulario");
	    model.addAttribute("torcedor", new Torcedor());
	    view.addObject("torcedores", dao.getAll());
	    view.addObject("frase", "Digite o seu nome e o time que você torce!");
	    return view;
	}

	@RequestMapping(value = "/formulario", method = RequestMethod.POST)
	public ModelAndView salvar(@ModelAttribute Torcedor torcedor) {
	   
	    ModelAndView view = new ModelAndView("formulario");
	    dao.salvar(torcedor);
	    view.addObject("torcedor", new Torcedor()); 
	    view.addObject("torcedores", dao.getAll());
	    view.addObject("frase", torcedor.getNome() + " torce para o " + torcedor.getTime());
	    return view;
	}

	
	@RequestMapping(value = "/excluir/{id}", method = RequestMethod.GET)
	public ModelAndView excluirTorcedor(@PathVariable("id") int id) {
		Long torcedorId = Long.valueOf(id);
		dao.excluir(torcedorId);
		ModelAndView view = new ModelAndView("redirect:/formulario");
	    view.addObject("torcedores", dao.getAll());
	    view.addObject("frase", "Torcedor excluído com sucesso.");
	    view.addObject("torcedor", new Torcedor());

	    return view;
	}


	@RequestMapping(value = "/editar/{id}", method = RequestMethod.GET)
	public ModelAndView exibirFormularioEdicao(@PathVariable("id") Long id) {
	    ModelAndView view = new ModelAndView("formulario"); // Nome da página JSP
	    Torcedor torcedor = dao.get(id); // Obter o torcedor do banco de dados pelo ID
	    view.addObject("torcedor", torcedor); // Adicionar o torcedor ao modelo
	    return view;
	}

	@RequestMapping(value = "/editar/{id}", method = RequestMethod.POST)
	public ModelAndView editarTorcedor(@ModelAttribute Torcedor torcedor, @PathVariable("id") Long id) {
	    ModelAndView view = new ModelAndView("redirect:/formulario");
	    dao.atualizar(id, torcedor);
	    return view;
	}

	@PostMapping("/cadastro")
	public String cadastrarUsuario(@RequestParam("username") String username, @RequestParam("password") String password) {
	    Cadastro cadastro = new Cadastro();
	    cadastro.setUsuario(username);
	    cadastro.setSenha(password);
	    
	    CadastroDAO.salvarLogin(cadastro);
	    
	    return "redirect:/index.jsp";
	}


}
package br.com.unipe.aula.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.unipe.aula.dao.TorcedorDAO;
import br.com.unipe.aula.model.Torcedor;

@Controller
public class WelcomeController {
	
	@Autowired
	private TorcedorDAO dao;
	
	@RequestMapping(value = "/teste", method = RequestMethod.GET)
	public String welcome() {
		return "welcome";
	}
	
	@RequestMapping(value = "/rota", method = RequestMethod.GET)
	public String teste() {
		return "viewteste";
	}
	
	@RequestMapping(value = "/outraforma", method = RequestMethod.GET)
	public ModelAndView teste2() {
		ModelAndView view = new ModelAndView("welcome");
		view.addObject("mensagem","Bem vindo a minha aplicação");
		return view;
	}
	
	@RequestMapping(value = "/formulario", method = RequestMethod.GET)
	public ModelAndView formulario(Model model) {
		ModelAndView view = new ModelAndView("formulario");
		model.addAttribute("torcedor", new Torcedor());
		view.addObject("torcedores", dao.getAll());
		view.addObject("frase","Digite o seu nome e o time que você torce!");
		return view;
	}
	
	@RequestMapping(value = "/formulario", method = RequestMethod.POST)
	public ModelAndView exibefrase(@ModelAttribute Torcedor torcedor) {
		ModelAndView view = new ModelAndView("formulario");
		dao.salvar(torcedor);
		view.addObject("torcedores", dao.getAll());
		view.addObject("frase", torcedor.getNome() + " torce para o " + torcedor.getTime());
		return view;
	}
	
	@GetMapping(value="/excluir/{id}")
	public String excluirTorcedor(@PathVariable("id") Long id, Model model) {
		dao.excluir(id);
		return "redirect:../formulario";
	}
	
	@GetMapping(value="/editar/{id}")
	public ModelAndView exibeEditarTorcedor(@PathVariable("id") Long id, Model model) {
		ModelAndView view = new ModelAndView("editar");
		model.addAttribute("torcedor", dao.getId(id));
		return view;
	}
	
	@PostMapping(value="/editar/{id}")
	public String confirmaEdicaoTorcedor(@PathVariable("id") int id, @ModelAttribute Torcedor torcedor) {
		dao.editar(torcedor);
		return "redirect:../formulario";
	}

}

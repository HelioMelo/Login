package br.com.unipe.aula.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.unipe.aula.dao.TorcedorDAO;
import br.com.unipe.aula.model.Torcedor;

@Controller
public class WelcomeController {
	
	@Autowired
	private TorcedorDAO dao;
	
	
	@RequestMapping(value = "/formulario", method = RequestMethod.GET)
	public ModelAndView carregarTorcedores(Model model) {
		ModelAndView view = new ModelAndView("formulario");
		model.addAttribute("torcedor", new Torcedor());
		view.addObject("torcedores", dao.getAll());
		view.addObject("frase","Digite o seu nome e o time que você torce!");
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
	
	@RequestMapping(value = "/excluir/{index}", method = RequestMethod.GET)
	public ModelAndView excluirTorcedor(@PathVariable("index") int index) {
	    ModelAndView view = new ModelAndView("redirect:/formulario");

	    dao.excluir(index);

	    view.addObject("torcedores", dao.getAll());
	    view.addObject("frase", "Torcedor excluído com sucesso.");

	    return view;
	}

	@RequestMapping(value = "/editar/{index}", method = RequestMethod.GET)
	public ModelAndView exibirFormularioEdicao(@PathVariable("index") int index) {
	    ModelAndView view = new ModelAndView("formulario");

	    Torcedor torcedor = dao.get(index);

	    view.addObject("torcedor", torcedor);
//	    view.addObject("torcedores", dao.getAll());
	    view.addObject("frase", "Edite os dados do torcedor e envie novamente.");

	    return view;
	}

	@RequestMapping(value = "/editar/{index}", method = RequestMethod.POST)
	public ModelAndView editarTorcedor(@ModelAttribute Torcedor torcedor, HttpServletRequest request) {
	    ModelAndView view = new ModelAndView("redirect:/formulario");
	    
	    String index = request.getParameter("index");
	    
	    dao.atualizar(Integer.parseInt(index), torcedor);
	    
	    view.addObject("index", index);

	    return view;
	}

}

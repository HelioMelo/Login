package br.com.unipe.aula.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.unipe.aula.model.Cadastro;

@Repository
public class CadastroDAO {

	
	 @PersistenceContext
	    private EntityManager entityManager;
	 
	 @Transactional(readOnly = false)
	    public void salvarLogin(Cadastro cadastro) {
	        entityManager.persist(cadastro);
	    }
	 
	 public Cadastro findByUsuario(String usuario) {
	        TypedQuery<Cadastro> query = entityManager.createQuery("SELECT c FROM Cadastro c WHERE c.usuario = :usuario", Cadastro.class);
	        query.setParameter("usuario", usuario);
	        List<Cadastro> usuarios = query.getResultList();
	        return usuarios.isEmpty() ? null : usuarios.get(0);
	    }

	    public boolean verificarSenha(String senhaDigitada, Cadastro usuario) {
	        return usuario != null && senhaDigitada.equals(usuario.getSenha());
	    }
	}
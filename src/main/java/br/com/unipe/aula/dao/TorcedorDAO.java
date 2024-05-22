package br.com.unipe.aula.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.unipe.aula.model.Torcedor;

@Repository
public class TorcedorDAO {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public TorcedorDAO() {
		
	}
	
	@Transactional(readOnly=false)
	public void salvar(Torcedor torcedor) {
		//torcedores.add(torcedor);
		entityManager.persist(torcedor);
	}
	
	@Transactional(readOnly=true)
	public List<Torcedor> getAll() { 
		return entityManager.createQuery("from Torcedor",Torcedor.class).getResultList();
	}
	
	@Transactional(readOnly=true)
	public Torcedor getId(Long id) {
		return entityManager.find(Torcedor.class, id);
	}
	
	@Transactional(readOnly=false)
	public void excluir(Long id) {
		//torcedores.remove(id);
		entityManager.remove(getId(id));
	}
	
	@Transactional(readOnly=false)
	public void editar(Torcedor torcedor) {
		entityManager.merge(torcedor);
	}

}

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
    
    public TorcedorDAO() {}

    @Transactional(readOnly = false)
    public void salvar(Torcedor torcedor) {
        entityManager.persist(torcedor);
    }

    @Transactional(readOnly = true)
    public List<Torcedor> getAll() {
    	return entityManager.createQuery("FROM Torcedor", Torcedor.class).getResultList();
    }

    @Transactional(readOnly = false)
    public void excluir(Long id) {
    	entityManager.remove(get(id));
    }

    @Transactional(readOnly = true)
    public Torcedor get(Long id) {
        return entityManager.find(Torcedor.class, id); 
    }


    @Transactional
    public void atualizar(Long id, Torcedor torcedor) {
        torcedor.setId(id);
        entityManager.merge(torcedor);
    

    }

}
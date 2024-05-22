package br.com.unipe.aula.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="torcedores")
public class Torcedor implements Serializable {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable=false, length=100)
	private String nome;
	@Column(nullable=false, length=100)
	private String time;
	
	public Torcedor() {}
	public Torcedor(Long id, String nome, String time) {
		super();
		this.id = id;
		this.nome = nome;
		this.time = time;
	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	

}

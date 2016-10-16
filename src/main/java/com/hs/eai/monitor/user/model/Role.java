package com.hs.eai.monitor.user.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name="roles")
@NamedQueries({ @NamedQuery(name = "Role.findByName", query = "from Role r where r.name = :name")
})
public class Role implements Serializable {

	@Id
	@GeneratedValue
	private Integer id;

	private String name;

	@ManyToMany(mappedBy = "roles",fetch = FetchType.EAGER)
    private List<User> users;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	
	
}

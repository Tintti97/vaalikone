package vaalikone;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import persist.Kysymykset;

@Path("/kys")
public class LisaaK {

	
	@POST
	@Path("/lisaak")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Kysymykset lisaaK(Kysymykset kys) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("vaalikones");
		EntityManager em = emf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(kys);
		em.getTransaction().commit();
		
		return kys;
	}
	

}
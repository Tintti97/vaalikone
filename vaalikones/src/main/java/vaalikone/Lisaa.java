package vaalikone;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persist.Ehdokkaat;

/**
 * Servlet implementation class Lisaa
 */
public class Lisaa extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Lisaa() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Luodaan yhteys JSP- sek‰ Java-servlettien v‰lille
		RequestDispatcher reqDispatcher = getServletConfig().getServletContext().getRequestDispatcher("/Add.jsp");
        reqDispatcher.include(request,response);
        
        //Luodaan yhteys tietokantaan
        EntityManagerFactory f = Persistence.createEntityManagerFactory("vaalikones");
        EntityManager em = f.createEntityManager();
        em.getTransaction().begin();
        
        //Luodaan uusi ehdokas-objekti
        Ehdokkaat ehdokas = new Ehdokkaat();
        
        //asdasd
		
        /*
         * Ehdokkaan ID:n asettaminen
         */
        
		//Luodaan maxId ja ehdokasId-muuttujat.
        int maxId=0;
        int ehdokasId;
        
        //Suoritetaan SQL-kysely, talletetaan tulokset listaan. Iteroidaan lista l‰pi niin saadaan id:den lukum‰‰r‰.
        Query q = em.createNativeQuery("select ehdokas_id from ehdokkaat;");
        List<Integer> t = q.getResultList();
        
        for (int i=0;i<t.size();i++) {
        	maxId++;
        }
    
        // Ehdokkaan ID:ksi tulee suurin ID+1.
        ehdokasId = maxId + 1;
        
        //Asetetaan ID.
        ehdokas.setEhdokasId(ehdokasId);
        
        /*
         * Haetaan tiedot Add.jsp:n tekstibokseista.
         * Asetetaan olion arvot syˆtetyn tiedon perusteella.
         */
        
		String etunimi = request.getParameter("etunimi");
		ehdokas.setEtunimi(etunimi);
		String sukunimi = request.getParameter("sukunimi");
		ehdokas.setSukunimi(sukunimi);
		String puolue = request.getParameter("puolue");
		ehdokas.setPuolue(puolue);
		
		try {
			String ika = request.getParameter("ika");
			ehdokas.setIka(Integer.parseInt(ika));
		} catch(NumberFormatException ex) {
			System.out.println(""); //keksi handlaus...?
		}
		
		String kotipaikkakunta = request.getParameter("kotipaikkakunta");
		ehdokas.setKotipaikkakunta(kotipaikkakunta);
		String ammatti = request.getParameter("ammatti");
		ehdokas.setAmmatti(ammatti);
		String miksiEduskuntaan = request.getParameter("miksiEduskuntaan");
		ehdokas.setMiksiEduskuntaan(miksiEduskuntaan);
		String mitaAsioitaHaluatEdistaa = request.getParameter("mitaAsioitaHaluatEdistaa");
		ehdokas.setMitaAsioitaHaluatEdistaa(mitaAsioitaHaluatEdistaa);
        
        //Tallennetaan tiedot 
		em.persist(ehdokas);
		em.getTransaction().commit();
		
		//Ohjataan takaisin admin-sivulle
		response.sendRedirect("/AddEditRemoveCand.jsp");
		
		
		
		
		//Tulisi sulkea entitymanagerit, mutta heitt‰‰ erroria...
		//f.close();
		//em.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	*/ 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
    
}
package TP3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servtest
 */
@WebServlet("/ScolariteManager")
public class ScolariteManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//Liste des étudiants
	static ArrayList<Etudiant> etudiants = new ArrayList<Etudiant>();

	//Liste des spécialités
	static ArrayList<String> specialites = new ArrayList<String>();
	
	//Liste des modules
	static ArrayList<String> modules = new ArrayList<String>();


    public ScolariteManager() {
        super();
		//ajout de 3 spécialités
		specialites.add("ICy");
		specialites.add("ME");
		specialites.add("MT");
		specialites.add("GI");
		specialites.add("GCB");
		specialites.add("IIA");
		
		//ajout de 5 modules
        modules.add("Analyse appliquée");
        modules.add("Probabilités");
        modules.add("Analyse numérique");
        modules.add("Organisation des entreprises");
        modules.add("Anglais");
        modules.add("Développement web");
        modules.add("Comptabilité");
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String origine = request.getHeader("referer");
		
		request.getSession().setAttribute("specialites", specialites);
		request.getSession().setAttribute("etudiants", etudiants);
		request.getSession().setAttribute("modules", modules);
		
		if(origine.equals("http://localhost:8080/TP3/Authentification.html")) {
			if((request.getParameter("identifiant").equals("admin_")) && (request.getParameter("password").equals("passwrd"))) {
				response.sendRedirect("http://localhost:8080/TP3/Accueil.html");
			}
			else {
				response.sendRedirect("http://localhost:8080/TP3/Authentification.html");
			}
		}
		
		//la requête peut venir d'un étudiant ou un prof, on va donc vérifier l'origine de la requête
		
		if(origine.equals("http://localhost:8080/TP3/Accueil.html")) {
			switch (request.getParameter("Action")) {
			case "inscription" :
				response.sendRedirect("http://localhost:8080/TP3/inscription.jsp");
				break;
			case "saisie" :
				response.sendRedirect("http://localhost:8080/TP3/saisieNote.jsp");
				break;
			case "aff_etu" :
				response.sendRedirect("http://localhost:8080/TP3/afficherEtudiant.jsp");
				break;
			case "aff_not" :
				response.sendRedirect("http://localhost:8080/TP3/afficherNotes.jsp");
				break;
			default :
				response.sendRedirect("http://localhost:8080/TP3/Accueil.html");
				break;
			}
		}

		if(origine.equals("http://localhost:8080/TP3/inscription.jsp")) {
			//on va chercher les paramètres de la requête
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String specialite = request.getParameter("specialite");

			//on crée un nouvel étudiant
			Etudiant etudiant = new Etudiant();
			etudiant.setNom(nom);
			etudiant.setPrenom(prenom);
			etudiant.setSpecialite(specialite);
			//on l'ajoute à la liste des étudiants
			etudiants.add(etudiant);
			request.getSession().setAttribute("etudiants", etudiants);
			response.sendRedirect("http://localhost:8080/TP3/Accueil.html");
		}
		
		if (origine.equals("http://localhost:8080/TP3/saisieNote.jsp")) {
			//on va chercher les paramètres de la requête
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String module = request.getParameter("module");
			String note = request.getParameter("note");
			//ajoute la note à l'étudiant
			for (Etudiant etudiant : etudiants) {
				if (etudiant.getNom().equals(nom) && etudiant.getPrenom().equals(prenom)) {
					etudiant.setNote(module, note);
				}
			}
			response.sendRedirect("http://localhost:8080/TP3/Accueil.html");
		}
		
		if (origine.equals("http://localhost:8080/TP3/afficherNotes.jsp")) {
			
			//on va chercher les paramètres de la requête
            String module = request.getParameter("module");
            
            //2D arraylist to store name and note
            ArrayList<String[]> notesEtu = new ArrayList<String[]>();
            
            System.out.println("etudiants :" + etudiants);
            
            for (Etudiant etudiant : etudiants) {
            	
                // vérifie dans la hashmap si l'étudiant a une note pour le module
            	System.out.println("hbdcdchdcb :" + etudiant.getNote());
                if (etudiant.getNote().containsKey(module)) {
                	System.out.println("blabla :" + module);
                	
                    // put 2D array with name and note in arraylist
                    notesEtu.add(new String[] {etudiant.getNom(), etudiant.getPrenom(), etudiant.getNote().get(module)});
                }
            }
            System.out.println("test :" + notesEtu);
            request.getSession().setAttribute("notesEtu", notesEtu);
            
            response.sendRedirect("http://localhost:8080/TP3/AffichageNotes.jsp");
            
    
        }
		
		//affichage des étudiants en fonction de la spécialité
        if (origine.equals("http://localhost:8080/TP3/afficherEtudiant.jsp")) {
        	
            //on va chercher les paramètres de la requête
            String specialite = request.getParameter("specialite");
            
            //2D arraylist to store name and note
            ArrayList<Etudiant> specialiteEtu = new ArrayList<Etudiant>();
            
            for (Etudiant etudiant : etudiants) {
            	
                // vérifie dans la hashmap si l'étudiant a une note pour le module
                if (etudiant.getSpecialite().equals(specialite)) {
                	
                    // put 2D array with name and note in arraylist
                	specialiteEtu.add(etudiant);
                }
            }
            request.getSession().setAttribute("specialiteEtu", specialiteEtu);
            
            response.sendRedirect("http://localhost:8080/TP3/AffichageEtu.jsp");
        }
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//send list of specialities to the jsp
        request.setAttribute("specialites", specialites);
        //send list of students to the jsp
        request.setAttribute("etudiants", etudiants);
        //forward the request to the jsp
        request.getRequestDispatcher("http://localhost:8080/TP3/inscription.jsp").forward(request, response);
        
        System.out.println(specialites);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
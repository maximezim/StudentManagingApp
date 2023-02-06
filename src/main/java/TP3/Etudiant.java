package TP3;


import java.util.HashMap;

public class Etudiant {
    private String nom, prenom, specialite;
    HashMap <String, String> note = new HashMap<String, String>();
    
    public Etudiant() {}
    
    public Etudiant(String _nom, String _prenom, String _specialite) {
    	nom = _nom;
    	prenom = _prenom;
    	specialite = _specialite;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getSpecialite() {
        return specialite;
    }

    public void setSpecialite(String specialite) {
        this.specialite = specialite;
    }

    public HashMap<String, String> getNote() {
        return note;
    }

    public void setNote(String module, String note) {
        this.note.put(module, note);
    }
    
    @Override
    public String toString() {
    	return nom + " " + prenom + " " + specialite;
    }
}
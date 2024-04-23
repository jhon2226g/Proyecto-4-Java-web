package Entidades;

public class Tecnico {
	// atributos
	private String COD_TEC;
    private String NOM_TEC;
    private String APE_TEC;
    private String CARG_TEC;

	public Tecnico(String cOD_TEC, String nOM_TEC, String aPE_TEC, String cARG_TEC) {
		COD_TEC = cOD_TEC;
		NOM_TEC = nOM_TEC;
		APE_TEC = aPE_TEC;
		CARG_TEC = cARG_TEC;
	}

	public Tecnico() {
	}

	public String getCOD_TEC() {
		return COD_TEC;
	}

	public void setCOD_TEC(String cOD_TEC) {
		COD_TEC = cOD_TEC;
	}

	public String getNOM_TEC() {
		return NOM_TEC;
	}

	public void setNOM_TEC(String nOM_TEC) {
		NOM_TEC = nOM_TEC;
	}

	public String getAPE_TEC() {
		return APE_TEC;
	}

	public void setAPE_TEC(String aPE_TEC) {
		APE_TEC = aPE_TEC;
	}

	public String getCARG_TEC() {
		return CARG_TEC;
	}

	public void setCARG_TEC(String cARG_TEC) {
		CARG_TEC = cARG_TEC;
	}




}
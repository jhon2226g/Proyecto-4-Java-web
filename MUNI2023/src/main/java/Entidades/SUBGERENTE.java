package Entidades;

public class SUBGERENTE {
	// atributos
	private String COD_GER;
    private String NOM_GER;
    private String APE_GER;
    private String DNI_GER;
	public SUBGERENTE(String cOD_GER, String nOM_GER, String aPE_GER, String dNI_GER) {
		COD_GER = cOD_GER;
		NOM_GER = nOM_GER;
		APE_GER = aPE_GER;
		DNI_GER = dNI_GER;
	}
	public String getCOD_GER() {
		return COD_GER;
	}
	public void setCOD_GER(String cOD_GER) {
		COD_GER = cOD_GER;
	}
	public String getNOM_GER() {
		return NOM_GER;
	}
	public void setNOM_GER(String nOM_GER) {
		NOM_GER = nOM_GER;
	}
	public String getAPE_GER() {
		return APE_GER;
	}
	public void setAPE_GER(String aPE_GER) {
		APE_GER = aPE_GER;
	}
	public String getDNI_GER() {
		return DNI_GER;
	}
	public void setDNI_GER(String dNI_GER) {
		DNI_GER = dNI_GER;
	}


}

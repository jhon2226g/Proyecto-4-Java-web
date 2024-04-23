package Entidades;

public class Contrato {
	// Campos o atributos
	private String NUM_CON;
	private String COD_TEC;
	private String FECH_INI;
	private String FECH_FIN;
	private String FECH_CON;
	private String COD_GER;
	private String COD_EMP;
	private int ESTADOS;
	private double SUELDO;
	private String AREA;
	public Contrato(String nUM_CON, String cOD_TEC, String fECH_INI, String fECH_FIN, String fECH_CON, String cOD_GER,
			String cOD_EMP, int eSTADOS, double sUELDO, String aREA) {
		NUM_CON = nUM_CON;
		COD_TEC = cOD_TEC;
		FECH_INI = fECH_INI;
		FECH_FIN = fECH_FIN;
		FECH_CON = fECH_CON;
		COD_GER = cOD_GER;
		COD_EMP = cOD_EMP;
		ESTADOS = eSTADOS;
		SUELDO = sUELDO;
		AREA = aREA;
	}
	public String getNUM_CON() {
		return NUM_CON;
	}
	public void setNUM_CON(String nUM_CON) {
		NUM_CON = nUM_CON;
	}
	public String getCOD_TEC() {
		return COD_TEC;
	}
	public void setCOD_TEC(String cOD_TEC) {
		COD_TEC = cOD_TEC;
	}
	public String getFECH_INI() {
		return FECH_INI;
	}
	public void setFECH_INI(String fECH_INI) {
		FECH_INI = fECH_INI;
	}
	public String getFECH_FIN() {
		return FECH_FIN;
	}
	public void setFECH_FIN(String fECH_FIN) {
		FECH_FIN = fECH_FIN;
	}
	public String getFECH_CON() {
		return FECH_CON;
	}
	public void setFECH_CON(String fECH_CON) {
		FECH_CON = fECH_CON;
	}
	public String getCOD_GER() {
		return COD_GER;
	}
	public void setCOD_GER(String cOD_GER) {
		COD_GER = cOD_GER;
	}
	public String getCOD_EMP() {
		return COD_EMP;
	}
	public void setCOD_EMP(String cOD_EMP) {
		COD_EMP = cOD_EMP;
	}
	public int getESTADOS() {
		return ESTADOS;
	}
	public void setESTADOS(int eSTADOS) {
		ESTADOS = eSTADOS;
	}
	public double getSUELDO() {
		return SUELDO;
	}
	public void setSUELDO(double sUELDO) {
		SUELDO = sUELDO;
	}
	public String getAREA() {
		return AREA;
	}
	public void setAREA(String aREA) {
		AREA = aREA;
	}




}

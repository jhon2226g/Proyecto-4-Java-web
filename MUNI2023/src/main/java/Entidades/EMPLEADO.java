package Entidades;

public class EMPLEADO {
	// atributos
		private String COD_EMP;
	    private String NOM_EMP;
	    private String APE_EMP;

	    private String TELEF_EMP;
	    private String DNI_EMP;
		private String CARG_EMP;
		private String DIREC_EMP;
		public EMPLEADO(String cOD_EMP, String nOM_EMP, String aPE_EMP, String tELEF_EMP,
				String dNI_EMP, String cARG_EMP, String dIREC_EMP) {
			COD_EMP = cOD_EMP;
			NOM_EMP = nOM_EMP;
			APE_EMP = aPE_EMP;

			TELEF_EMP = tELEF_EMP;
			DNI_EMP = dNI_EMP;
			CARG_EMP = cARG_EMP;
			DIREC_EMP = dIREC_EMP;
		}
		public String getCOD_EMP() {
			return COD_EMP;
		}
		public void setCOD_EMP(String cOD_EMP) {
			COD_EMP = cOD_EMP;
		}
		public String getNOM_EMP() {
			return NOM_EMP;
		}
		public void setNOM_EMP(String nOM_EMP) {
			NOM_EMP = nOM_EMP;
		}
		public String getAPE_EMP() {
			return APE_EMP;
		}
		public void setAPE_EMP(String aPE_EMP) {
			APE_EMP = aPE_EMP;
		}

		public String getTELEF_EMP() {
			return TELEF_EMP;
		}
		public void setTELEF_EMP(String tELEF_EMP) {
			TELEF_EMP = tELEF_EMP;
		}
		public String getDNI_EMP() {
			return DNI_EMP;
		}
		public void setDNI_EMP(String dNI_EMP) {
			DNI_EMP = dNI_EMP;
		}
		public String getCARG_EMP() {
			return CARG_EMP;
		}
		public void setCARG_EMP(String cARG_EMP) {
			CARG_EMP = cARG_EMP;
		}
		public String getDIREC_EMP() {
			return DIREC_EMP;
		}
		public void setDIREC_EMP(String dIREC_EMP) {
			DIREC_EMP = dIREC_EMP;
		}





}
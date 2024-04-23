package modelo;

public class venta {

	 private String IdVenta;
	 private String IdCliente;
	 private String FechaVenta;
	 private Double MontoTotal ;
	 private String Estado ;
	public venta(String idVenta, String idCliente, String fechaVenta, Double montoTotal, String estado) {
		super();
		IdVenta = idVenta;
		IdCliente = idCliente;
		FechaVenta = fechaVenta;
		MontoTotal = montoTotal;
		Estado = estado;
	}
	public String getIdVenta() {
		return IdVenta;
	}
	public void setIdVenta(String idVenta) {
		IdVenta = idVenta;
	}
	public String getIdCliente() {
		return IdCliente;
	}
	public void setIdCliente(String idCliente) {
		IdCliente = idCliente;
	}
	public String getFechaVenta() {
		return FechaVenta;
	}
	public void setFechaVenta(String fechaVenta) {
		FechaVenta = fechaVenta;
	}
	public Double getMontoTotal() {
		return MontoTotal;
	}
	public void setMontoTotal(Double montoTotal) {
		MontoTotal = montoTotal;
	}
	public String getEstado() {
		return Estado;
	}
	public void setEstado(String estado) {
		Estado = estado;
	}



}

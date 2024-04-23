package modelo;

public class detalle {
	private String IdVenta;
    private String IdProducto;
    private int Cantidad;
    private double PrecioUnidad;
    private String Estado;

	public detalle(String idVenta, String idProducto, int cantidad, double precioUnidad, String estado) {
		super();
		IdVenta = idVenta;
		IdProducto = idProducto;
		Cantidad = cantidad;
		PrecioUnidad = precioUnidad;
		Estado = estado;
	}
	public String getIdVenta() {
		return IdVenta;
	}
	public void setIdVenta(String idVenta) {
		IdVenta = idVenta;
	}
	public String getIdProducto() {
		return IdProducto;
	}
	public void setIdProducto(String idProducto) {
		IdProducto = idProducto;
	}
	public int getCantidad() {
		return Cantidad;
	}
	public void setCantidad(int cantidad) {
		Cantidad = cantidad;
	}
	public double getPrecioUnidad() {
		return PrecioUnidad;
	}
	public void setPrecioUnidad(double precioUnidad) {
		PrecioUnidad = precioUnidad;
	}
	public String getEstado() {
		return Estado;
	}
	public void setEstado(String estado) {
		Estado = estado;
	}
    public double monto() {
    	return this.Cantidad * this.PrecioUnidad;
    }
}

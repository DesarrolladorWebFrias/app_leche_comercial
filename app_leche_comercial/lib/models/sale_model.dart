class Sale {
  int? id;
  String fechaHora;
  String rutaVenta;
  double totalVenta;
  double denominacionPagoCliente;
  double cambio;
  int idProducto;
  int cantidad;
  String tipoUnidad;
  String? nombreProducto; // Para mostrar en la lista de ventas

  Sale({
    this.id,
    required this.fechaHora,
    required this.rutaVenta,
    required this.totalVenta,
    required this.denominacionPagoCliente,
    required this.cambio,
    required this.idProducto,
    required this.cantidad,
    required this.tipoUnidad,
    this.nombreProducto,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fecha_hora': fechaHora,
      'ruta_venta': rutaVenta,
      'total_venta': totalVenta,
      'denominacion_pago_cliente': denominacionPagoCliente,
      'cambio': cambio,
      'id_producto': idProducto,
      'cantidad': cantidad,
      'tipo_unidad': tipoUnidad,
    };
  }

  factory Sale.fromMap(Map<String, dynamic> map) {
    return Sale(
      id: map['id'],
      fechaHora: map['fecha_hora'],
      rutaVenta: map['ruta_venta'],
      totalVenta: map['total_venta'],
      denominacionPagoCliente: map['denominacion_pago_cliente'],
      cambio: map['cambio'],
      idProducto: map['id_producto'],
      cantidad: map['cantidad'],
      tipoUnidad: map['tipo_unidad'],
      nombreProducto: map['nombre_producto'],
    );
  }
}
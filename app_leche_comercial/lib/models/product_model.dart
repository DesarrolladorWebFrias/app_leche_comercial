class Product {
  final int? id;
  final String nombre;
  final double precioCompra;
  final double precioVenta;

  Product({
    this.id,
    required this.nombre,
    required this.precioCompra,
    required this.precioVenta,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'precio_compra': precioCompra,
      'precio_venta': precioVenta,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      nombre: map['nombre'],
      precioCompra: map['precio_compra'],
      precioVenta: map['precio_venta'],
    );
  }
}
